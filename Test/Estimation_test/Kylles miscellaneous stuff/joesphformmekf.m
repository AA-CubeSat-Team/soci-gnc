
function [vestt,qest,ytil,beta_est,omega_est,qerr] = josephformmekf(qe,q_true,...
    omega_tilda,P,R,m,Ri,Bb,Rb,nr,np,Beta,del_t,Q_k)
for i = 1:m
   Q = [qe(1:3,1)]; %change these q's to be q(1,1)
        Qx = [0 -qe(3) qe(2);qe(3) 0 -qe(1);-qe(2) qe(1) 0]; %cross product matrix of q
        Xi_q = [qe(4)*eye(3)+Qx;-Q'];
        Phi_q = [qe(4)*eye(3)-Qx;-Q'];
        A_q = Xi_q'*Phi_q;   %A(q_k minus) matrix
        
%         rx = [0 -Ri(3) Ri(2);Ri(3) 0 -Ri(1);-Ri(2) Ri(1) 0];
        mat = A_q*Ri;
            mat_x = [0 -mat(3) mat(2);mat(3) 0 -mat(1);-mat(2) mat(1) 0]; %cross product matrix of q
        mat1 = A_q*Bb;
            mat_x1 = [0 -mat1(3) mat1(2);mat1(3) 0 -mat1(1);-mat1(2) mat1(1) 0];
        
%%%%% Calcualte Kalman Gain
        H = [mat_x, zeros(3,3);mat_x1,zeros(3,3)]; 
        %%%Gain
        H = [mat_x, zero]; %sensitivity matrix
        K = (P*H')*inv(H*P*H' + R);
        
        
        %%%Update
%         P = (eye(6)-K*H)*P;
        P = (eye(6)-K*H)*P*(eye(6)-K*H)' + K*R*K';
        vestt(:,i) = diag(P).^(0.5);

        del_x = K*(Rb(:,i)-A_q*Ri);
%         qmix = ([qest(4,i);-qest(1,i);-qest(2,i);-qest(3,i)]')
%         quatrotate(qmix,r)
        ytil(:,i) = A_q*Ri;
        
        % q = [q1;q2;q3;q4];
        del_alpha = del_x(1:3,1);
        dalpha(:,i) = del_alpha;
        del_beta = del_x(4:6,1);
        
        qe = qe + 0.5*Xi_q*del_alpha;
        qe = 1/(norm(qe))*qe; %renormalize
        qest(:,i) = qe; %store the quaternion
        g(:,i) = qe(1:3)/qe(4);
        
           %%%calculate error
            qmix1 = ([qest(4,i);qest(1,i);qest(2,i);qest(3,i)]');
                qmix = ([qest(4,i);-qest(1,i);-qest(2,i);-qeFst(3,i)]');
                    qmix_true = ([q_true(4,i);q_true(1,i);q_true(2,i);q_true(3,i)]');
                        qm(i,:) = quat_err(qmix1,qmix_true);
                            qerr = qm(:,1:3)*2; % error quaternion as a vector
        
        
%         constraint = qe'*qe; %should equal 1 or very close, normalize
        Beta = Beta + del_beta;
         beta_est(:,i) = Beta;
        
        %%%Propagation%%%
        omega = omega_tilda(i,:)' - Beta;
        omega_est(:,i) = omega;
        om_mag = norm(omega); %norm of omega estimate
        sin_omega = sin(0.5*om_mag*del_t);
        
        Psi = (sin_omega*omega)/om_mag;
        Psi_x = [0 -Psi(3) Psi(2);Psi(3) 0 -Psi(1);-Psi(2) Psi(1) 0];
        
        Omega_omega = [(cos(0.5*om_mag*del_t)*eyez - Psi_x), Psi; -Psi', cos(0.5*om_mag*del_t)];
        cos_omega = (1-cos(om_mag*del_t))/om_mag^2;
        
        omega_x = [0 -omega(3) omega(2);omega(3) 0 -omega(1);-omega(2) omega(1) 0];
                Phi_discrete = [(eyez-omega_x*sin(om_mag*del_t)/om_mag + (omega_x^2)*cos_omega),omega_x*cos_omega-eyez*del_t-omega_x^2*(om_mag*del_t-sin(om_mag*del_t))/om_mag^3;
            zero,eyez;];
        
        
        qe = Omega_omega*qe; %quaternion propagation
        
        P = Phi_discrete*P*Phi_discrete' + gamma*Q_k*gamma';
end
end
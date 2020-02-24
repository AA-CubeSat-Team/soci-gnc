


function [vestt,qest,ytil,beta_est,omega_est] = jmekf(qe,...
    omega_tilda,P,R,m,sc,bc,ymeas,Beta,del_t,Q_k,gamma)
eyez = eye(3,3);
zero = zeros(3,3);
for i = 1:m
%    Q = [qe(2:4,1)]; %change these q's to be q(1,1)
%         Qx = [0 -Q(3) Q(2);Q(3) 0 -Q(1);-Q(2) Q(1) 0]; %cross product matrix of q
%         XI = [qe(1)*eye(3)+Qx;-Q'];
%         
        XI = [ -qe(2) -qe(3) -qe(4);
        qe(1) -qe(4)  qe(3);
        qe(4)  qe(1) -qe(2);
       -qe(3)  qe(2)  qe(1) ];
        
        
%         Phi_q = [qe(4)*eye(3)-Qx;-Q'];
%         A_q = Xi_q'*Phi_q;   %A(q_k minus) matrix
          A_q = quat2dcm(qe');
%         dcm = quat2dcm([qe(1),Q'])
%         rx = [0 -Ri(3) Ri(2);Ri(3) 0 -Ri(1);-Ri(2) Ri(1) 0];
        mat = A_q*sc(i,:)';
            mat_x = [0 -mat(3) mat(2);mat(3) 0 -mat(1);-mat(2) mat(1) 0]; %cross product matrix of q
        mat1 = A_q*bc(i,:)';
            mat_x1 = [0 -mat1(3) mat1(2);mat1(3) 0 -mat1(1);-mat1(2) mat1(1) 0];
%       
%%%%% Calcualte Kalman Gain
        H = [mat_x, zeros(3,3);mat_x1,zeros(3,3)];
%             H = [A_q*Ri_x, zeros(3,3);A_q*Bb_x,zeros(3,3)];
        %%%Gain

%         K = (P*H')*inv(H*P*H' + R);
        K = P*H'/(H*P*H' + R);
        
        %%%Update
        P = (eye(6)-K*H)*P;

        vestt(:,i) = diag(P).^(0.5);

        del_x = K*(ymeas(:,i)-[A_q*sc(i,:)';A_q*bc(i,:)']);

        ytil(:,i) = A_q*sc(i,:)';
        
        % q = [q1;q2;q3;q4];
        del_alpha = del_x(1:3,1);
        dalpha(:,i) = del_alpha;
        del_beta = del_x(4:6,1);

        qe = qe + 0.5*XI*del_alpha;
        qe = 1/(norm(qe))*qe; %renormalize
        qest(:,i) = qe; %store the quaternion
%         g(:,i) = qe(1:3)/qe(4);
        
       
        
        
%         constraint = qe'*qe; %should equal 1 or very close, normalize
        Beta = Beta + del_beta;
         beta_est(:,i) = Beta;
        
        %%%Propagation%%%
        omega = omega_tilda(i,:)' - Beta;
        omega_est(:,i) = omega;
        om_mag = norm(omega,2); %norm of omega estimate
        sin_omega = sin(0.5*om_mag*del_t);
        
        Psi = (sin_omega*omega)/om_mag;
        Psi_x = [0 -Psi(3) Psi(2);Psi(3) 0 -Psi(1);-Psi(2) Psi(1) 0];
        
        Omega_omega = [(cos(0.5*om_mag*del_t)*eye(3) - Psi_x), Psi; -Psi', cos(0.5*om_mag*del_t)];
        cos_omega = (1-cos(om_mag*del_t))/om_mag^2;
        omega_x = [0 -omega(3) omega(2);omega(3) 0 -omega(1);-omega(2) omega(1) 0];
        
                Phi_discrete = [(eyez-omega_x*sin(om_mag*del_t)/om_mag + (omega_x^2)*cos_omega),omega_x*cos_omega-eyez*del_t-omega_x^2*(om_mag*del_t-sin(om_mag*del_t))/om_mag^3;
            zero,eyez;];
%    
        qe = Omega_omega*qe; %quaternion propagation
        
        P = Phi_discrete*P*Phi_discrete' + gamma*Q_k*gamma';
% P = phi*P*phi' + qcc;

end
end
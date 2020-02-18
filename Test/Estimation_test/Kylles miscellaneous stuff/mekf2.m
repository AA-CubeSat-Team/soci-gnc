function [vestt,qest,ytil,beta_est,omega_est,qerr] = mekf2(qe,q_true,...
    omega_tilda,P_sq,R,m,Ri,Bb,nr,np,Beta,del_t,Q_sq,y_tilda,gamma)

S = P_sq;
% del_x = zeros(6,1);
%%%%%%% THIS ROUTINE USES THE MEKF ALGORITHM IN TABLE 7.1 OF 
%%%% CRASSIDIS/JUNKINS OPTIMAL ESTIMATION OF DYNAMIC SYSTEMS BOOK %%%%%%%%


%%%%%%%% INPUTS %%%%%%%
    %qe is the initial condition for the quaternion
    %q_true is the true quaternion
    %omega_tilda is the synthetic angular velo measurement
    %P_sq is the cholesky decomp of the initial state cov matrix
    %R_sq is the cholesky decomp of the measurement cov matrix
    %m is the length of the time horizon
    %Ri is the inertial sun vector (fixed for this simulation)
    %Bb is the inertial magnetic field vector (fixed for this simulation)
    %nr and np are the sizes of the R and P matrices
    %Beta is the inital gyro bias condition
    %del_t is the time step
    %Q_sq is the cholesky decomposition of the process noise covariance
   

%%%%%%%% OUTPUTS %%%%%%%
    %vestt is the diagnals of the state cov matrix, used to 3 sigma bounds
    %qest is the estimated quaternion
    %ytil is the synthetic attitude measurements
    %beta_est is the estimated gyro bias
    %omega_est is the estimated angular velocity
    %qerr is the error quaternion

for i = 1:m
%%%%%formulate some Dynamic Paramaters %%%%%
        Q = [qe(1:3,1)];
            Qx = [0 -qe(3) qe(2);qe(3) 0 -qe(1);-qe(2) qe(1) 0]; %cross product matrix of q
                Xi_q = [qe(4)*eye(3)+Qx;-Q'];
                    Phi_q = [qe(4)*eye(3)-Qx;-Q'];
                        A_q = Xi_q'*Phi_q;   %A(q_k minus) matrix

        mat = A_q*Ri;
            mat_x = [0 -mat(3) mat(2);mat(3) 0 -mat(1);-mat(2) mat(1) 0]; %cross product matrix of q
        mat1 = A_q*Bb;
            mat_x1 = [0 -mat1(3) mat1(2);mat1(3) 0 -mat1(1);-mat1(2) mat1(1) 0];
        
%%%%% Calcualte Kalman Gain and covariance Plus
        H = [mat_x, zeros(3,3);mat_x1,zeros(3,3)];
        yhat = [A_q*Ri;A_q*Bb];
        ytilde = y_tilda(:,i);
        [P_sq,del_x] = potter(P_sq,H,R,ytilde,yhat);
%          
%%%%%%% Measurement Update %%%%%%
        full_P  = P_sq*P_sq';
            vestt(:,i) = diag(full_P).^(0.5); % store diagnonals of the cov matrix for 3 sigma bounds
% Alpha_K = TA'*[Alpha_K;R_sq*[A_q*Ri;A_q*Bb]];
%         del_x = K*(y_tilda(:,i)-[A_q*Ri;A_q*Bb]);
% del_x = inv(Sk_plus)*Alpha_k;
            del_alpha = del_x(1:3,1);
                del_beta = del_x(4:6,1);
                    qe = qe + 0.5*Xi_q*del_alpha; % estimated quaternion
                        qe = 1/(norm(qe))*qe; % renormalize Quaternion
        
        %store the quaternion, 
        qest(:,i) = qe;
        
        %%%calculate error
            qmix1 = ([qest(4,i);qest(1,i);qest(2,i);qest(3,i)]');
                qmix = ([qest(4,i);-qest(1,i);-qest(2,i);-qest(3,i)]');
                    qmix_true = ([q_true(4,i);q_true(1,i);q_true(2,i);q_true(3,i)]');
                        qm(i,:) = quat_err(qmix1,qmix_true);
                            qerr = qm(:,1:3)*2; % error quaternion as a vector

        ytil(:,i) = quatrotate(qmix1,Ri'); % create estimated attitude measurement

        Beta = Beta + del_beta; %updated Bias estimate
        beta_est(:,i) = Beta;
        
        
%%%%%% Time Propagation%%%
        omega_meas = omega_tilda(i,:);
            omega = omega_tilda(i,:)' - Beta;
                omega_est(:,i) = omega;
                    om_mag = norm(omega); %norm of omega estimate
        sin_omega = sin(0.5*om_mag*del_t);
            Psi = (sin_omega*omega)/om_mag;
                Psi_x = [0 -Psi(3) Psi(2);Psi(3) 0 -Psi(1);-Psi(2) Psi(1) 0];
        
        Omega_omega = [(cos(0.5*om_mag*del_t)*sparse(eye(3)) - Psi_x), Psi; -Psi', cos(0.5*om_mag*del_t)];
            cos_omega = (1-cos(om_mag*del_t))/om_mag^2;
                omega_x = [0 -omega(3) omega(2);omega(3) 0 -omega(1);-omega(2) omega(1) 0];
                    
                    Phi_discrete = [(sparse(eye(3))-omega_x*sin(om_mag*del_t)/om_mag + (omega_x^2)*cos_omega),...
                        omega_x*cos_omega-sparse(eye(3))*del_t-omega_x^2*(om_mag*del_t-sin(om_mag*del_t))/om_mag^3;
                            zeros(3,3),sparse(eye(3));];
        
          qe = Omega_omega*qe; %quaternion propagation
% %        
%           C = [Phi_discrete*P_sq;gamma*Q_sq'];
%             [Tc,Uc] = qr(C);
%                 sq_P_kp1 = Uc(1:6,1:6)';
%                     P_sq = sq_P_kp1; % sq_Pkpl becomes P_sq minus
          P = P_sq*P_sq';
      P = Phi_discrete*P*Phi_discrete' + gamma*Q_k*gamma';
    P_sq = chol(P,'lower');
    
end
end


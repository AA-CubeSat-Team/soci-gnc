clear all
close all
clc

%%%% This .m file creates synthetic attitude measurements, angular velocity measurements
% and quaternion data to be used in a multiplicative extended kalman filter (mekf)
% This code also runs a simulink model of the mekf routine for comparison
% to the script, although with added features in the simulink model, such
% as sesnsor health validation

% the mekf routine used is found in crassidis and Junkins Optimal Estimation, 
%, 2nd edition in Table 7.1, with the discrete time optional formulation
% found on pages 456-460
set_param(bdroot,'ShowLineDimensions','on')

% other .m files needed to run this script are: quat.err.m , mekf.m , 
%lib_testValidity.slx , MEKF_ValidityTester_Lib2018.slx (the mekf Library) 

%%%% PARAMETERS %%%%%
tspan = [0:0.1:500]; % time span
m = length(tspan);
Rb = zeros(6,length(tspan)); % allocate space for sensor measurment vector
sig_v = sqrt(10)*1e-7;% angle random walk
sig_u = sqrt(10)*1e-10; % gyro rate random walk
sun_sensor_var = 0.5/(sqrt(3)*3.0); % sun sensor measurement covariance
mag_var =  ([ 2e-7; 2e-7; 2e-7 ]); %10^-6*[0.403053;0.240996;0.173209]; % magnetometer covariance
del_t = tspan(2)-tspan(1); % create time step


%%%%% CREATE ANGULAR VELOCITY VECTOR AND INITIAL QUATERNION VALUE %%%%%%%
% w=[zeros(m,1) 0.01*ones(m,1) zeros(m,1)];
% q0=[cos(pi/2)*sin(-pi/4);sin(pi/2)*sin(pi/4);sin(pi/2)*cos(-pi/4);cos(pi/2)*cos(-pi/4)];
% q=zeros(m,4);q(1,:)=q0(:)';
% del_t1 = 40;

%%%%%%% Quaternion Over Time %%%%%%%%%%%%
% for i=1:m-1,
%  wnorm=norm(w(i,:));
%  co=cos(0.5*wnorm*del_t1);
%  si=sin(0.5*wnorm*del_t1);
%  n1=w(i,1)/wnorm;n2=w(i,2)/wnorm;n3=w(i,3)/wnorm;
%  qw1=n1*si;qw2=n2*si;qw3=n3*si;qw4=co;
%  om=[qw4  qw3 -qw2 qw1;-qw3  qw4  qw1 qw2;qw2 -qw1  qw4 qw3;-qw1 -qw2 -qw3 qw4];
%  q(i+1,1:4)=(om*q(i,1:4)')';
% end
q = csvread('qtrue.csv');
q = [q(:,1),q(:,2),q(:,3),q(:,4)]; % whole quaternion over time
w0 = [-0.1;0.06;0.012];
% w0 = [0;0.01;0];
%%%%%%%% CREATE ANGULAR VELOCITY VECTOR, WITH NOISE %%%%%%%%%%%

% Get True Rates (note: bias is simulated in discrete-time)
% From Reynolds, R., "Maximum Likelihood Estimation of Stability Parameters for the Standard 
% Gyroscopic Error Model," Flight Mechanics Symposium, NASA-Goddard Space Flight Center, 
% Greenbelt, MD, Oct. 2003, NASA CP-2003-212246, paper #42.

% wtrue=[zeros(m,1) 0.01*ones(m,1) zeros(m,1)];; % Rotate about the -y-body axis
% sigu=sig_u;
% sigv=sig_v;
% num_g=del_t*[1 1];den_g=2*[1 -1];
% [phi_g,gam_g,c_g,d_g]=tf2ss(num_g,den_g);
% bias1=dlsim(phi_g,gam_g,c_g,d_g,sigu/sqrt(del_t)*randn(m,1),0.1*pi/180/3600/del_t);
% bias2=dlsim(phi_g,gam_g,c_g,d_g,sigu/sqrt(del_t)*randn(m,1),0.1*pi/180/3600/del_t);
% bias3=dlsim(phi_g,gam_g,c_g,d_g,sigu/sqrt(del_t)*randn(m,1),0.1*pi/180/3600/del_t);
% bias=[bias1 bias2 bias3];
% omega_tilda=wtrue+sqrt(sigv^2/del_t+1/12*sigu^2*del_t)*randn(m,3)+bias; % angular velocity synthetic noisy measurements with random walk
%
omega_tilda = csvread('omega.csv');

%%%%%%%% CREATE VALIDITY BOOLEAN SIGNALS FOR HEALTH CHECK OF EACH SENSOR%%
    
valid1 = [tspan',ones(m,1)]; % gives health of sun sensor 1 == valid, 0 == invalid data
  valid2 = [tspan',ones(m,1)]; % gives health of mag sensor 1 == valid, 0 == invalid data
    valid3 = [tspan',ones(m,1)]; % gives health of gyro sensor 1 == valid, 0 == invalid data
%     valid1(400:410,2) = 0;
%     valid2(100:200,2) = 0;
%    valid3(10:15,2) = 0;
w = csvread('omega.csv');
bc = csvread('bb.csv');
sc = csvread('sun.csv');
%%%%%%%% CREATE ATTITUDE VECOTRS IN BODY FRAME OF REFERENCE %%%%%%%%
    for ii = 1:length(tspan)
        qq1 = q(ii,1);
        qq2 = q(ii,2);
        qq3 = q(ii,3);
        qq4 = q(ii,4);
        q_true(:,ii) = q(ii,1:4)'; % create true quaternion values over time
        
%         CIB = [(1-2.*(qq2.^2 + qq3.^2)) ,(2.*qq1.*qq2 + 2.*qq3.*qq4), (2.*qq1.*qq3 - 2.*qq2.*qq4);
%             (2.*qq1.*qq2 - 2.*qq3.*qq4) ,(1 - 2.*(qq1.^2 + qq3.^2)), 2.*qq2.*qq3 + 2.*qq1.*qq4;
%             (2.*qq1.*qq3 + 2.*qq2.*qq4) ,(2.*qq2.*qq3 -2.*qq1.*qq4), (1-2.*(qq1.^2 + qq2.^2))]; %rotation matrix, takes vector in inertial frame to body frame
%         
        CIB = quat2dcm([qq1,qq2,qq3,qq4]);
        eps = (sun_sensor_var)*randn(3,m);% Gaussian noise vector for sun sensor
        epsb = diag(mag_var)*randn(3,m); % Gaussian noise vector for mag sensor
%         Ri = [-0.981837657101834,0.174061775743718,0.0754805492940078]
%         Ri(ii,:) = sc(ii,:); % create simulated inertial-frame sun unit vector
%         Bb(ii,:) = bc(ii,:);
%         Bb = Bb./norm(Bb);% create simulated inertial-frame mag field unit vector
        ymeas(:,ii) = [(CIB*sc(ii,:)') + eps(:,1);(CIB*bc(ii,:)') + epsb(:,1)]; %noisy values put into one 6x1 synthetic measurement vector (what the sun/mag sensors will give us)
%         Rb_hat(:,ii) = [(CIB*Ri);(CIB*Bb)]; % true values: measurment values are organized like measurement = [sun suensor mesaurements (3x1); mag sensor measurements (3x1)];
        
    end
    

%%%%% EKF initialize values %%%%%%
%%%%% Look in Crassidius and Junkins 2nd Edition pages 450-460 MEKF
 %                     Algorithm for what these values are %%%%
    del_t = tspan(2)-tspan(1);
    R = [sun_sensor_var^2*eye(3),zeros(3,3);zeros(3,3),diag((mag_var.^2).*ones(3,1))]; %measurement cov matrix
    Beta = 0.1*(1/3600)*(pi/180)*[1; 1; 1]; % Initialize gyro Bias
    Beta_init = 0.1*(1/3600)*(pi/180)*[1; 1; 1]; % set Bias initial condition
    
   
    Q_k = [(sig_v^2*del_t + 1/3*sig_u^2*del_t^3)*eye(3), -(0.5*sig_u^2*del_t^2)*eye(3);
        -(0.5*sig_u^2*del_t^2)*eye(3), (sig_u^2*del_t)*eye(3)]; % Create Process noise matrix
    
    gamma = [-eye(3),zeros(3,3);zeros(3,3),eye(3)];
%     qe = [0.707;0.707;0;0]; % initialize quaternion
    qe = [0.0831095662269988;0.597780725760345;0.533215448243828;0.592817248117098];
    qe_init = qe;
%     qe_init = qe; %set initial value of quaternion
    P = 0.1*eye(6);
%     P = [(0.1*pi/180)^2*eye(3) zeros(3,3); 
%         zeros(3,3),(0.2*pi/180/3600)*eye(3)];%initialize covariance matrix
    P_sq = chol(P,'lower'); % Cholesky decomposition of state cov matrix
    P_sq_init = P_sq; % set initial value of the sqrt state cov matrix
    R_sq = chol(R,'lower'); % Cholesky decomposition of measruement cov matrix
    [np,mp] = size(P); % find size of matrix P (P_sq) & R for code generality
    [nr,mr] = size(R_sq); % ^^
    Q_sq = chol((gamma*Q_k*gamma'),'lower');% Cholesky decomposition of process noise cov matrix
    
     P_sq_inv = inv(P_sq);
      R_sq_inv = inv(R_sq);
      [V,DD] = eig(Q_k); 
%     Q_sq = (VV*(chol(DD,'lower')))';
    K_i = zeros(6,6);
    S_i = zeros(6,6);
%     sigv = sig_v;
%     sigu = sig_u;
    dt = del_t;
    g = gamma;
    sigv = sig_v*eye(3);
    sigu = sig_u*eye(3);
    qc(1:3,1:3)=(dt*sigv.^2+dt^3*sigu.^2/3);
qc(1:3,4:6)=(0.5*dt^2*sigu.^2);
qc(4:6,1:3)=qc(1:3,4:6)';
qc(4:6,4:6)=dt*sigu.^2;
qcc=g*qc*g';

%%%%%%%%% SQUARE ROOT MEKF ROUTINE %%%%%%%%%%% 

% Look in mekf.m for what inputs and outputs are
% EKF (note: covariance is error quaternion)
y_tilda = Rb;
del_x = zeros(6,1);
%  [vestt,qest,ytil,beta_est,omega_est,qerr] = mekf2(qe,q_true,...
%     omega_tilda,P_sq,R,m,Ri,Bb,nr,np,Beta,del_t,Q_k,y_tilda,gamma); %DESCRIPTION IN mekf.m


% omega_tilda = csvread('omega.csv');

%   [vestt,qest,ytil,beta_est,omega_est,qerr] = mekf(qe,q_true,...
%     omega_tilda,P,R,m,R_sq,Ri,Bb,Rb,nr,np,Beta,del_t,Q_k,gamma);

% [vestt,qest,ytil,beta_est,omega_est,qerr] = jmekf(qe,q_true,...
%     omega_tilda,P,R,m,sc,bc,ymeas,nr,np,Beta,del_t,Q_k,gamma,qcc,dt)
[vestt,qest,ytil,beta_est,omega_est,qerr] = mekf(qe,q_true,...
    omega_tilda,P_sq,R_sq,m,sc,bc,nr,np,Beta,del_t,Q_sq,ymeas)

% for i = 1:m
% %%%%%formulate some Dynamic Paramaters %%%%%
%         Q = [qe(1:3,1)];
%             Qx = [0 -qe(3) qe(2);qe(3) 0 -qe(1);-qe(2) qe(1) 0]; %cross product matrix of q
%                 Xi_q = [qe(4)*eye(3)+Qx;-Q'];
%                     Phi_q = [qe(4)*eye(3)-Qx;-Q'];
%                         A_q = Xi_q'*Phi_q;   %A(q_k minus) matrix
% 
%         mat = A_q*Ri;
%             mat_x = [0 -mat(3) mat(2);mat(3) 0 -mat(1);-mat(2) mat(1) 0]; %cross product matrix of q
%         mat1 = A_q*Bb;
%             mat_x1 = [0 -mat1(3) mat1(2);mat1(3) 0 -mat1(1);-mat1(2) mat1(1) 0];
%         
% %%%%% Calcualte Kalman Gain
%         H = [mat_x, zeros(3,3);mat_x1,zeros(3,3)]; %sensitivity matrix
% %             A = [R_sq',zeros(nr,np);(P_sq)*H', P_sq];
%             A = [R_sq',zeros(nr,np);(P_sq')*H', P_sq];
% %                 Sk_tilda_plus = [P_sq;R_sq*H];
%                 [TA,UA] = qr(A); % note: the qr method is needed for the square root implementation, this is a deviation from the book
%                     P_sq = UA(7:12,7:12)'; %Updated P_sq
%                         W = UA(1:6,7:12)';
%                             sq_Bk = UA(1:6,1:6)';
%                                 K = W*inv(sq_Bk);
% 
% %               
% %          
% %%%%%%% Measurement Update %%%%%%
%         full_P  = P_sq*P_sq';
%             vestt(:,i) = diag(full_P).^(0.5); % store diagnonals of the cov matrix for 3 sigma bounds
% % Alpha_K = TA'*[Alpha_K;R_sq*[A_q*Ri;A_q*Bb]];
%         del_x = K*(Rb(:,i)-[A_q*Ri;A_q*Bb]);
% % del_x = inv(Sk_plus)*Alpha_k;
%             del_alpha = del_x(1:3,1);
%                 del_beta = del_x(4:6,1);
%                     qe = qe + 0.5*Xi_q*del_alpha; % estimated quaternion
%                         qe = 1/(norm(qe))*qe; % renormalize Quaternion
%         
%         %store the quaternion, 
%         qest(:,i) = qe;
%         
%         %%%calculate error
%             qmix1 = ([qest(4,i);qest(1,i);qest(2,i);qest(3,i)]');
%                 qmix = ([qest(4,i);-qest(1,i);-qest(2,i);-qest(3,i)]');
%                     qmix_true = ([q_true(4,i);q_true(1,i);q_true(2,i);q_true(3,i)]');
%                         qm(i,:) = quat_err(qmix1,qmix_true);
%                             qerr = qm(:,1:3)*2; % error quaternion as a vector
% 
%         ytil(:,i) = quatrotate(qmix1,Ri'); % create estimated attitude measurement
% 
%         Beta = Beta + del_beta; %updated Bias estimate
%         beta_est(:,i) = Beta;
%         
%         
% %%%%%% Time Propagation%%%
%         omega_meas = omega_tilda(i,:);
%             omega = omega_tilda(i,:)' - Beta;
%                 omega_est(:,i) = omega;
%                     om_mag = norm(omega); %norm of omega estimate
%         sin_omega = sin(0.5*om_mag*del_t);
%             Psi = (sin_omega*omega)/om_mag;
%                 Psi_x = [0 -Psi(3) Psi(2);Psi(3) 0 -Psi(1);-Psi(2) Psi(1) 0];
%         
%         Omega_omega = [(cos(0.5*om_mag*del_t)*sparse(eye(3)) - Psi_x), Psi; -Psi', cos(0.5*om_mag*del_t)];
%             cos_omega = (1-cos(om_mag*del_t))/om_mag^2;
%                 omega_x = [0 -omega(3) omega(2);omega(3) 0 -omega(1);-omega(2) omega(1) 0];
%                     
%                     Phi_discrete = [(sparse(eye(3))-omega_x*sin(om_mag*del_t)/om_mag + (omega_x^2)*cos_omega),...
%                         omega_x*cos_omega-sparse(eye(3))*del_t-omega_x^2*(om_mag*del_t-sin(om_mag*del_t))/om_mag^3;
%                             zeros(3,3),sparse(eye(3));];
%         
%           qe = Omega_omega*qe; %quaternion propagation
%        
%           C = [P_sq'*Phi_discrete';Q_sq'];
%             [Tc,Uc] = qr(C);
%                 sq_P_kp1 = Uc(1:6,1:6)';
%                     P_sq = sq_P_kp1; % sq_Pkpl becomes P_sq minus
%             
%                 
%             
% %     
%     
% end
% 

%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%% SETUP PARAMETERS FOR SIMULINK MODEL %%%%%%%%
estimation = struct;

t = tspan; % time horizon
tfinal = tspan(m); %final time
sig_v   = sqrt(10)*1e-7;            % angle random walk
sig_u   = sqrt(10)*1e-10;           % rate random walk
%%%%% Synthetic Measurements for simulink%%%%%
        Rb1 = [tspan',Rb(1:3,:)']; %sun sensor inertial vec
        Rb2 = [tspan',Rb(4:6,:)']; %mag sensor inertial vec
        om1 = [tspan',omega_tilda(:,1),omega_tilda(:,2),omega_tilda(:,3)]; %angular velocity maeasurement vec

%%%% Initial Conditions %%%%%
        estimation.ic.Beta_init = 0.0*[1;1;1];%Initialize gyro Bias
        estimation.ic.quat_est_init = [0.707;0.707;0;0]; 
      
%                 P = [(0.1*pi/180)^2*eye(3) zeros(3,3);
%                 zeros(3,3),(0.2*pi/180/3600)*eye(3)];
                estimation.P_sq = chol(P,'lower'); %create square root form of cov matrix
        estimation.ic.P_sq_init = estimation.P_sq; %initial value of cov matrix for simulink

%%%%%%% Time step that the MEKF is ran at %%%%%%%
        estimation.del_t = del_t; 

%%%%%%% Constant MAtrices %%%%%%%%%%%
        estimation.Q_k = [(sig_v^2*estimation.del_t + 1/3*sig_u^2*estimation.del_t^3)*eye(3), (0.5*sig_u^2*estimation.del_t^2)*eye(3);
                (0.5*sig_u^2*estimation.del_t^2)*eye(3), (sig_u^2*estimation.del_t)*eye(3)]; %create dynamic nnoise measurement matrix
        estimation.gamma = [-eye(3),zeros(3,3);zeros(3,3),eye(3)];
        estimation.Q_sq = chol((estimation.gamma*estimation.Q_k*estimation.gamma'),'lower'); %square root dynamic noise matrix

            R = [sun_sensor_var^2*eye(3),zeros(3,3);zeros(3,3),diag(mag_var.^2)]; %create measurment error cov matrix
        estimation.R_sq = chol(R,'lower');  % reate square root form of measurement cov matrix  

        fswParams.estimation = estimation;
        
        figure
    subplot(2,2,1)
        plot(t,q(:,1),'k',t,qest(1,:),'--m')
        title('q1 Evolution/Estimates')
        xlabel('Time (s)')
        ylabel('q1 (rad)')
        grid on
        legend('True q_1','Estimated q_1 (simulink)','Estimated q_1 (script)','Location','southeast')

        subplot(2,2,2)
            plot(t,q(:,2),'k*',t,qest(2,:),'--m')
            title('q2 Evolution/Estimates')
            xlabel('Time (s)')
            ylabel('q2 (rad)')
            grid on
            legend('True q_2','Estimated q_2 (simulink)','Estimated q_2 (script)','Location','southwest')

            subplot(2,2,3)
                plot(t,q(:,3),'k*',t,qest(3,:),'--m')
                title('q3 Evolution/Estimates')
                xlabel('Time (s)')
                ylabel('q3 (rad)')
                grid on
                legend('True q_3','Estimated q_3 (simulink)','Estimated q_3 (script)','Location','northeast')

                subplot(2,2,4)
                    plot(t,q(:,4),'k*',t,qest(4,:),'--m')
                    title('q4 Evolution/Estimates')
                    xlabel('Time (s)')
                    ylabel('q4 (rad)')
                    grid on
                    legend('True q_4','Estimated q_4 (simulink)','Estimated q_4 (script)','Location','northwest')
        
        
        
%%%%%%%% RUN SIMULINK MODEL %%%%%%%%

simout1=sim('lib_testValidity','StopTime','tfinal', ...
    'SaveTime','on','TimeSaveName','timeoutNew',...
    'SaveOutput','on','OutputSaveName','youtNew');

        time2=simout1.get('timeoutNew');
        y=simout1.get('youtNew');
        qest_simu = y{2}.Values.Data'; %get out estimated quaternions from simulink
        % the simulink estimated quaternion
        
        
        sigma_simu = y{4}.Values.Data';%get out 3 sigma bounds from simulink (already multiplied by 3 and converted to degrees)

%%%%%%%%% CALCULATE THE ERROR QUATERNION FROM SIMULINK Q_EST %%%%%%%%%
for i = 1:m
    qmix1s = ([qest_simu(4,i);qest_simu(1,i);qest_simu(2,i);qest_simu(3,i)]');
        qmix_true = ([q_true(4,i);q_true(1,i);q_true(2,i);q_true(3,i)]');
        qm(i,:) = quat_err(qmix1s,qmix_true);
        qerrs = qm(:,1:3)*2;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% CREATE FIGURE 1: ESTIMATED VS TRUE QUATERNION %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
    subplot(2,2,1)
        plot(t,q(:,1),'k*',t,qest_simu(1,:),'g',t,qest(1,:),'--m')
        title('q1 Evolution/Estimates')
        xlabel('Time (s)')
        ylabel('q1 (rad)')
        grid on
        legend('True q_1','Estimated q_1 (simulink)','Estimated q_1 (script)','Location','southeast')

        subplot(2,2,2)
            plot(t,q(:,2),'k*',t,qest_simu(2,:),'g',t,qest(2,:),'--m')
            title('q2 Evolution/Estimates')
            xlabel('Time (s)')
            ylabel('q2 (rad)')
            grid on
            legend('True q_2','Estimated q_2 (simulink)','Estimated q_2 (script)','Location','southwest')

            subplot(2,2,3)
                plot(t,q(:,3),'k*',t,qest_simu(3,:),'g',t,qest(3,:),'--m')
                title('q3 Evolution/Estimates')
                xlabel('Time (s)')
                ylabel('q3 (rad)')
                grid on
                legend('True q_3','Estimated q_3 (simulink)','Estimated q_3 (script)','Location','northeast')

                subplot(2,2,4)
                    plot(t,q(:,4),'k*',t,qest_simu(4,:),'g',t,qest(4,:),'--m')
                    title('q4 Evolution/Estimates')
                    xlabel('Time (s)')
                    ylabel('q4 (rad)')
                    grid on
                    legend('True q_4','Estimated q_4 (simulink)','Estimated q_4 (script)','Location','northwest')
                    
%%%%%%%% QUATERNION ERROR PLOTS %%%%%%%%%%%%%%%%
figure
 subplot(3,1,1)
            hold all;
%             plot(t,sigma_simu(1,:),'*c')
%             plot(t,-sigma_simu(1,:),'*m')
            plot(t,3*180/pi*vestt(1,:),':m','LineWidth',2);
            plot(t,qerr(1:end,1)'*180/pi,'k'); %%% Script Error
%             plot(t,qerrs(1:end,1)*180/pi,'b'); %%% Simulink Error
            plot(t,-3*180/pi*vestt(1,:),':c','LineWidth',2);
            title('q_1 Error & 3\sigma Bounds')
            legend('+3\sigma bound (simulink)','-3\sigma bound (simulink)','+3\sigma bound','Script q_1 Error','Simu q_1 Error',...
                '-3\sigma bound','Orientation','horizontal','Location','southeast')
            xlabel('Time (s)')
            ylabel('3 \sigma bound Error (deg)')
            grid on

                subplot(3,1,2)
                    hold all;
                    plot(t,sigma_simu(2,:),'*c')
                    plot(t,-sigma_simu(2,:),'*m')
                    plot(t,3*180/pi*vestt(2,:),':m','LineWidth',2);
                    plot(t,qerr(1:end,2)*180/pi,'k'); %%% Script Error
                    plot(t,qerrs(1:end,2)*180/pi,'b'); %%% Simulink Error
                    plot(t,-3*180/pi*vestt(2,:),':c','LineWidth',2);
                    title('q_2 Error & 3\sigma Bounds')
                    legend('+3\sigma bound (simulink)','-3\sigma bound (simulink)','+3\sigma bound','Script q_2 Error','Simu q_2 Error',...
                        '-3\sigma bound','Orientation','horizontal','Location','southeast')
                    xlabel('Time (s)')
                    ylabel('3 \sigma bound Error (deg)')
                    grid on
                
                        subplot(3,1,3)
                            hold all;
                            plot(t,sigma_simu(3,:),'*c')
                            plot(t,-sigma_simu(3,:),'*m')
                            plot(t,3*180/pi*vestt(3,:),':m','LineWidth',2);
                            plot(t,qerr(1:end,3)*180/pi,'k'); %%% Script Error
                            plot(t,qerrs(1:end,3)*180/pi,'b'); %%% Simulink Error
                            plot(t,-3*180/pi*vestt(3,:),':c','LineWidth',2);
                            title('q_3 Error &3\sigma Bounds')
                            legend('+3\sigma bound (simulink)','-3\sigma bound (simulink)','+3\sigma bound','Script q_3 Error','Simu q_3 Error',...
                                '-3\sigma bound','Orientation','horizontal','Location','southeast')
                            xlabel('Time (s)')
                            ylabel('3 \sigma bound Error (deg)')
                            grid on
                    
                   
%%%%%%%%%%%%%% CREATE FIGURE 3: ESTIMATED Attitudes VS TRUE %%%%%%%%%%%%%%%%

figure
    subplot(3,1,1)
    hold on
    plot(t,Rb(1,:)*180/pi,'--r',t,ytil(1,:)*180/pi,'g',t,Rb_hat(1,:)*180/pi,'--k')
    title('Roll Angle Time Evolution/Estimates')
    xlabel('Time (s)')
    ylabel('Roll Angle (deg)')
    grid on
    legend('Noisy Roll Data', 'Estimated Roll', 'True Roll')
    
        subplot(3,1,2)
            hold on
            plot(t,Rb(2,:)*180/pi,'--r',t,ytil(2,:)*180/pi,'g',t,Rb_hat(2,:)*180/pi,'--k')%,t,omega_est(1,:),t,omega_tilda(:,1),t,x1(:,5))
            title('Pitch Angle Time Evolution/Estimates')
            xlabel('Time (s)')
            ylabel('Pitch Angle (deg)')
            grid on
            legend('Noisy Pitch Data', 'Estimated Pitch Angle', 'True Pitch Angle')

                subplot(3,1,3)
                    plot(t,Rb(3,:)*180/pi,'--r',t,ytil(3,:)*180/pi,'g',t,Rb_hat(3,:)*180/pi,'--k')
                    title('Yaw Angle Time Evolution/Estimates')
                    xlabel('Time (s)')
                    ylabel('Yaw Angle (deg)')
                    grid on
                    legend('Noisy Yaw Data', 'Estimated Yaw Angle', 'True Yaw Angle')

        
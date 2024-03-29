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


% other .m files needed to run this script are: quat.err.m , mekf.m , 
%lib_testValidity.slx , MEKF_ValidityTester_Lib2018.slx (the mekf Library) 

%%%% PARAMETERS %%%%%
tspan = [0:0.1:200]; % time span
m = length(tspan);
Rb = zeros(6,length(tspan)); % allocate space for sensor measurment vector
sig_v = sqrt(10)*1e-4;% zero mean gaussian covariance of gyro process noise
sig_u = sqrt(6)*1e-8; % gyro random walk seems to work beter and converge quicker when this is smaller than sig_v
sun_sensor_var = 0.0029/3; % sun sensor measurement covariance
mag_var =  10^-6*[0.403053;0.240996;0.173209]; % magnetometer covariance
del_t = tspan(2)-tspan(1); % create time step


%%%%% CREATE ANGULAR VELOCITY VECTOR AND INITIAL QUATERNION VALUE %%%%%%%
w=[zeros(m,1) -inv(91.5/(2*pi)*60)*ones(m,1) zeros(m,1)];
q0=[cos(pi/2)*sin(-pi/4);sin(pi/2)*sin(pi/4);sin(pi/2)*cos(-pi/4);cos(pi/2)*cos(-pi/4)];
q=zeros(m,4);q(1,:)=q0(:)';
del_t1 = 40;

%%%%%%%% Quaternion Over Time %%%%%%%%%%%%
for i=1:m-1,
 wnorm=norm(w(i,:));
 co=cos(0.5*wnorm*del_t1);
 si=sin(0.5*wnorm*del_t1);
 n1=w(i,1)/wnorm;n2=w(i,2)/wnorm;n3=w(i,3)/wnorm;
 qw1=n1*si;qw2=n2*si;qw3=n3*si;qw4=co;
 om=[qw4  qw3 -qw2 qw1;-qw3  qw4  qw1 qw2;qw2 -qw1  qw4 qw3;-qw1 -qw2 -qw3 qw4];
 q(i+1,1:4)=(om*q(i,1:4)')';
end
q = [q(:,2),q(:,3),q(:,4),q(:,1)]; % whole quaternion over time

%%%%%%%% CREATE ANGULAR VELOCITY VECTOR, WITH NOISE %%%%%%%%%%%

% Get True Rates (note: bias is simulated in discrete-time)
% From Reynolds, R., "Maximum Likelihood Estimation of Stability Parameters for the Standard 
% Gyroscopic Error Model," Flight Mechanics Symposium, NASA-Goddard Space Flight Center, 
% Greenbelt, MD, Oct. 2003, NASA CP-2003-212246, paper #42.

wtrue=[zeros(m,1) -inv(91.5/(2*pi)*60)*ones(m,1) zeros(m,1)]; % Rotate about the -y-body axis
sigu=sig_u;
sigv=sig_v;
num_g=del_t*[1 1];den_g=2*[1 -1];
[phi_g,gam_g,c_g,d_g]=tf2ss(num_g,den_g);
bias1=dlsim(phi_g,gam_g,c_g,d_g,sigu/sqrt(del_t)*randn(m,1),0.1*pi/180/3600/del_t);
bias2=dlsim(phi_g,gam_g,c_g,d_g,sigu/sqrt(del_t)*randn(m,1),0.1*pi/180/3600/del_t);
bias3=dlsim(phi_g,gam_g,c_g,d_g,sigu/sqrt(del_t)*randn(m,1),0.1*pi/180/3600/del_t);
bias=[bias1 bias2 bias3];
omega_tilda=wtrue+sqrt(sigv^2/del_t+1/12*sigu^2*del_t)*randn(m,3)+bias; % angular velocity synthetic noisy measurements with random walk


%%%%%%%% CREATE VALIDITY BOOLEAN SIGNALS FOR HEALTH CHECK OF EACH SENSOR%%
    
valid1 = [tspan',ones(m,1)]; % gives health of sun sensor 1 == valid, 0 == invalid data
  valid2 = [tspan',ones(m,1)]; % gives health of mag sensor 1 == valid, 0 == invalid data
    valid3 = [tspan',ones(m,1)]; % gives health of gyro sensor 1 == valid, 0 == invalid data
%     valid1(400:410,2) = 0;
%     valid2(100:200,2) = 0;
%    valid3(10:15,2) = 0;


%%%%%%%% CREATE ATTITUDE VECOTRS IN BODY FRAME OF REFERENCE %%%%%%%%
    for ii = 1:length(tspan)
        qq1 = q(ii,1);
        qq2 = q(ii,2);
        qq3 = q(ii,3);
        qq4 = q(ii,4);
        q_true(:,ii) = q(ii,1:4)'; % create true quaternion values over time
        
        CIB = [(1-2.*(qq2.^2 + qq3.^2)) ,(2.*qq1.*qq2 + 2.*qq3.*qq4), (2.*qq1.*qq3 - 2.*qq2.*qq4);
            (2.*qq1.*qq2 - 2.*qq3.*qq4) ,(1 - 2.*(qq1.^2 + qq3.^2)), 2.*qq2.*qq3 + 2.*qq1.*qq4;
            (2.*qq1.*qq3 + 2.*qq2.*qq4) ,(2.*qq2.*qq3 -2.*qq1.*qq4), (1-2.*(qq1.^2 + qq2.^2))]; %rotation matrix, takes vector in inertial frame to body frame
        
        
        eps = (sun_sensor_var)*randn(3,m);% Gaussian noise vector for sun sensor
        epsb = diag(mag_var)*randn(3,m); % Gaussian noise vector for mag sensor
        Ri = [0.7;0.9;0.1];
        Ri = Ri./norm(Ri); % create simulated inertial-frame sun unit vector
        Bb = [0.7;0.1;1]; 
        Bb = Bb./norm(Bb);% create simulated inertial-frame mag field unit vector
        Rb(:,ii) = [(CIB*Ri) + eps(:,1);(CIB*Bb) + epsb(:,1)]; %noisy values put into one 6x1 synthetic measurement vector (what the sun/mag sensors will give us)
        Rb_hat(:,ii) = [(CIB*Ri);(CIB*Bb)]; % true values: measurment values are organized like measurement = [sun suensor mesaurements (3x1); mag sensor measurements (3x1)];
        
    end
    

%%%%% EKF initialize values %%%%%%
%%%%% Look in Crassidius and Junkins 2nd Edition pages 450-460 MEKF
 %                     Algorithm for what these values are %%%%
    del_t = tspan(2)-tspan(1);
    R = [sun_sensor_var^2*eye(3),zeros(3,3);zeros(3,3),diag(mag_var.^2)]; %measurement cov matrix
    Beta = [0;0;0]; % Initialize gyro Bias
    Beta_init = Beta; % set Bias initial condition
    Q_k = [(sig_v^2*del_t + 1/3*sig_u^2*del_t^3)*eye(3), (0.5*sig_u^2*del_t^2)*eye(3);
        (0.5*sig_u^2*del_t^2)*eye(3), (sig_u^2*del_t)*eye(3)]; % Create Process noise matrix
    gamma = [-eye(3),zeros(3,3);zeros(3,3),eye(3)];
    qe = [0.707;0.707;0;0]; % initialize quaternion
    qe_init = qe; %set initial value of quaternion
    P = eye(6);
%     P = [(0.1*pi/180)^2*eye(3) zeros(3,3); 
%         zeros(3,3),(0.2*pi/180/3600)*eye(3)];%initialize covariance matrix
    P_sq = chol(P,'lower'); % Cholesky decomposition of state cov matrix
    P_sq_init = P_sq; % set initial value of the sqrt state cov matrix
    R_sq = chol(R,'lower'); % Cholesky decomposition of measruement cov matrix
    [np,mp] = size(P); % find size of matrix P (P_sq) & R for code generality
    [nr,mr] = size(R_sq); % ^^
    Q_sq = chol((gamma*Q_k*gamma'),'lower');% Cholesky decomposition of process noise cov matrix
     

%%%%%%%%% SQUARE ROOT MEKF ROUTINE %%%%%%%%%%% 

% Look in mekf.m for what inputs and outputs are
% EKF (note: covariance is error quaternion)
 [vestt,qest,ytil,beta_est,omega_est,qerr] = mekf(qe,q_true,omega_tilda,...
     P_sq,R_sq,m,Ri,Bb,Rb,nr,np,Beta,del_t,Q_sq); %DESCRIPTION IN mekf.m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%% SETUP PARAMETERS FOR SIMULINK MODEL %%%%%%%%
estimation = struct;

t = tspan; % time horizon
tfinal = tspan(m); %final time

%%%%% Synthetic Measurements for simulink%%%%%
        Rb1 = [tspan',Rb(1:3,:)']; %sun sensor inertial vec
        Rb2 = [tspan',Rb(4:6,:)']; %mag sensor inertial vec
        om1 = [tspan',omega_tilda]; %angular velocity maeasurement vec

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
            plot(t,sigma_simu(1,:),'*c')
            plot(t,-sigma_simu(1,:),'*m')
            plot(t,3*180/pi*vestt(1,:),':m','LineWidth',2);
            plot(t,qerr(1:end,1)'*180/pi,'k'); %%% Script Error
            plot(t,qerrs(1:end,1)*180/pi,'b'); %%% Simulink Error
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
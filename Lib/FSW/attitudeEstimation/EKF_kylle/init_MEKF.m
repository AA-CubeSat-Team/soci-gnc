
%%%%% THIS SCRIPT SETS UP PARAMETERS AND INITIAL CONDITIONS FOR the simulink estimator
                                     
estimation = struct;

%%%% Initial Conditions %%%%%
   

estimation.ic.Beta_init = [0 0 0];%Initialize gyro Bias
estimation.ic.quat_est_init = simParams.initialConditions.q0;
estimation.ic.w_init = [0 0 0]';
% estimation.sampleTime_s = .001;


%         P = [(0.1*pi/180)^2*eye(3) zeros(3,3);
%         zeros(3,3),(0.2*pi/180/3600)*eye(3)];\
P = 0.000001.*eye(6);
       
estimation.ic.P_init = P;

% Process and measurement covariances

sig_v = sqrt(10)*1e-7;     % angle random walk
sig_u = sqrt(10)*1e-10;    % rate random walk

sun_sensor_var = 1; %0.5/(sqrt(2)*3.0); % sun sensor measurement covariance (radians)
mag_var =  10^-6*[0.403053;0.240996;0.173209]; % magnetometer covariance (micro tesla)

%%Time step that the MEKF is ran at
estimation.dt = fswParams.sample_time_s; 
dt = estimation.dt;
%Constant MAtrices
estimation.Q_k = [(sig_v^2*dt + 1/3*sig_u^2*dt^3)*eye(3)    -(1/2*sig_u^2*dt^2)*eye(3);
                   -(1/2*sig_u^2*dt^2)*eye(3)              (sig_u^2*dt)*eye(3)]; %create dynamic nnoise measurement matrix


estimation.gamma = blkdiag(-eye(3),eye(3));
estimation.Qg = estimation.gamma*estimation.Q_k*estimation.gamma';
estimation.R = [sun_sensor_var^2*eye(3),          zeros(3,3);
                    zeros(3,3),       ((mag_var.^2)).*eye(3)]; %create measurment error cov matrix

fswParams.estimation = estimation;
clear estimation
clear sig_v sig_u sun_sensor_var mag_var zero R Beta P
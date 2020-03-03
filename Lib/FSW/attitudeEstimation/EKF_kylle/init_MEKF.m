%%%%% THIS SCRIPT SETS UP PARAMETERS AND INITIAL CONDITIONS FOR the simulink estimator
                                     
estimation = struct;

%%%% Initial Conditions %%%%%

estimation.ic.Beta_init = [0;0;0];%Initialize gyro Bias
% estimation.ic.quat_est_init = [1;0;0;0]; 
estimation.ic.quat_est_init = simParams.initialConditions.q0;
estimation.ic.w_init = [0.00;0.00;0.00];

%Create covariance matrix for estimate
 P_0_a = (0.1*pi/180)^2;  % attitude
P_0_b = (0.2*pi/180/3600); % bias
estimation.ic.P_init = blkdiag(P_0_a*eye(3),P_0_b*eye(3));

% Process and measurement covariances

sig_v = sqrt(10)*1e-10;     % angle random walk
sig_u = sqrt(10)*1e-11;    % rate random walk

sun_sensor_var = (6e-5)^2; %0.5/(sqrt(2)*3.0); % sun sensor measurement covariance (radians)
mag_var =  10^-6*[0.403053;0.240996;0.173209]; % magnetometer covariance (micro tesla)

%%Time step that the MEKF is ran at
estimation.dt = fswParams.sample_time_s; 
dt = estimation.dt;

estimation.Q_k = [(sig_v^2*dt + 1/3*sig_u^2*dt^3)*eye(3)    -(1/2*sig_u^2*dt^2)*eye(3);
                   -(1/2*sig_u^2*dt^2)*eye(3)              (sig_u^2*dt)*eye(3)]; %create dynamic nnoise measurement matrix
%Constant MAtrices
estimation.gamma = blkdiag(-eye(3),eye(3));
estimation.Qg = estimation.gamma*estimation.Q_k*estimation.gamma';
estimation.R = [sun_sensor_var^2*eye(3),zeros(3,3);zeros(3,3),((mag_var.^2)).*eye(3)]; %create measurment error cov matrix

fswParams.estimation = estimation;
clear estimation
clear sig_v sig_u sun_sensor_var mag_var zero R Beta P
%%%%% THIS SCRIPT SETS UP PARAMETERS AND INITIAL CONDITIONS FOR the simulink estimator
                                     
estimation = struct;

%%%% Initial Conditions %%%%%
% simParams.initialConditions.w0 = [-0.2;0.1;0.04];
estimation.ic.Beta_init = [0;0;0];%Initialize gyro Bias
% estimation.ic.quat_est_init = [1;0;0;0]; 
estimation.ic.quat_est_init = simParams.initialConditions.q0;
estimation.ic.w_init = [0.00;0.00;0.00];

%Create covariance matrix for estimate
 P_0_a = 0.001;  % attitude
P_0_b = 0.01; % bias
estimation.ic.P_init = blkdiag(P_0_a*eye(3),P_0_b*eye(3));
% estimation.ic.P_init = 1e-10*eye(6,6);
% Process and measurement covariances

sig_v = (1e-4);     % angle random walk
sig_u = (1e-4);    % rate random walk

sun_sensor_std_devi = sqrt(1e-3); %0.5/(sqrt(2)*3.0); % sun sensor measurement covariance (radians)
% mag_var =  10^-6*[0.403053;0.240996;0.173209]; % magnetometer covariance (micro tesla)
mag_std_devi = sqrt(2e-7);
%%Time step that the MEKF is ran at
estimation.dt = fswParams.sample_time_s; 
dt = estimation.dt;

estimation.Q_k = [(sig_v^2*dt + 1/3*sig_u^2*dt^3)*eye(3)    -(1/2*sig_u^2*dt^2)*eye(3);
                   -(1/2*sig_u^2*dt^2)*eye(3)              (sig_u^2*dt)*eye(3)]; %create dynamic nnoise measurement matrix
%Constant MAtrices
estimation.gamma = blkdiag(-eye(3),eye(3));
estimation.Qg = estimation.gamma*estimation.Q_k*estimation.gamma';
estimation.R = [sun_sensor_std_devi.^2*eye(3),zeros(3,3);zeros(3,3),((mag_std_devi.^2)).*eye(3)]; %create measurment error cov matrix

fswParams.estimation = estimation;
clear estimation
clear sig_v sig_u sun_sensor_var mag_var zero R Beta P
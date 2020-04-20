%%%%% THIS SCRIPT SETS UP PARAMETERS AND INITIAL CONDITIONS FOR the simulink estimator
                                     
estimation = struct;

%%%% Initial Conditions %%%%%
estimation.ic.Beta_init = [0;0;0];%Initialize gyro Bias
estimation.ic.quat_est_init = [1;0;0;0]; 
simParams.initialConditions.q0 = [1;0;0;0];
estimation.ic.quat_est_init = simParams.initialConditions.q0;

%Create covariance matrix for estimate
P_0_a = 3.0462e-6;  % attitude
P_0_b =9.4018e-13; % bias
P_init = blkdiag(P_0_a*eye(3),P_0_b*eye(3));
estimation.ic.Pchol_init = chol(P_init,'lower');

fswParams.sample_time_s = 1/30; %set all sample times the same
dt = fswParams.sample_time_s;
simParams.sensors.sample_time_s = dt;
simParams.sample_time_s = dt;
simParams.sensors.gyro.sample_time_s = dt;
simParams.sensors.mag.sample_time_s = dt; 
simParams.sensors.sun_sensor.sample_time_s = dt;


sun_sensor_std = (5e-3); %0.5/(sqrt(2)*3.0); % sun sensor measurement covariance (radians)
% mag_sens_std =  sqrt([2e-7;2e-7;2e-7]); %10^-6*[0.403053;0.240996;0.173209]; % magnetometer covariance (micro tesla)
mag_sens_std  = ([2e-7;2e-7;2e-7]);


% Process and measurement covariances
sig_v = ((sqrt(10)*1e-6));     % angle random walk Actual
sig_u = ((sqrt(10)*1e-6));    % rate random walk

Q_k = [(sig_v^2*dt + 1/3*sig_u^2*dt^3)*eye(3)   -(1/2*sig_u^2*dt^2)*eye(3); %create dynamic nnoise measurement matrix
                   -(1/2*sig_u^2*dt^2)*eye(3)              (sig_u^2*dt)*eye(3)]; 

              
%%Time step that the MEKF is ran at
estimation.dt = fswParams.sample_time_s; 
dt = estimation.dt;
estimation.sample_time_s = dt;

%Constant Matrices sqrt form
gamma = blkdiag(-eye(3),eye(3));
Q = gamma*Q_k*gamma';
estimation.Qchol = chol(Q,'lower');

R = [(sun_sensor_std^2)*eye(3),zeros(3,3);zeros(3,3),((mag_sens_std.^2)).*eye(3)]; %create measurment error cov matrix
estimation.Rchol = chol(R,'lower');


fswParams.estimation = estimation;
clear estimation
clear sig_v sig_u sun_sensor_var mag_var zero R Beta P P_0_a P_0_b sun_sensor_std mag_var_std dt gamma Qg R
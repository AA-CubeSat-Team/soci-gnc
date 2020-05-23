

%Author: Kylle Ashton 5/18/2020
%Title: MEKF Initialization 
%Description:% Initialize Parameters for the MEKF 
                                     
estimation = struct;

%%%% Initial Conditions %%%%%
estimation.ic.Beta_init = [0;0;0];%Initialize gyro Bias
estimation.ic.quat_est_init = [1;0;0;0]; 
% simParams.initialConditions.q0 = [1;0;0;0];
% simParams.initialConditions.w0 = [0.1;0.1;-0.2];
estimation.ic.quat_est_init = simParams.initialConditions.q0;
% simParams.scParams.J = [3,-2,-1;-2,3,-1;-1,-1,4];


%%%%Rate Transitions
estimation.ic.sun_valid_rt = 1;
estimation.ic.mag_valid_rt = 1;
estimation.ic.gyro_valid_rt = 1;
estimation.ic.sc2sun_eci_unit_rt = [0;0;0];
estimation.ic.B_eci_unit_rt = [0;0;0];
estimation.ic.sunsensor_body_rad_rt = [0;0;0];
estimation.ic.mag_body_rt = [0;0;0];
estimation.ic.gyro_meas_rt = [0;0;0];
estimation.ic.triad_activate_rt = 0;

%Create covariance matrix for estimate
P_0_a = 10e-10;  % attitude
P_0_b =10e-10; % bias
P_init = blkdiag(P_0_a*eye(3),P_0_b*eye(3));
estimation.ic.Pchol_init = chol(P_init,'lower');


sun_sensor_std = 0.5/(sqrt(3)*3.0)*pi/180; %0.5/(sqrt(2)*3.0); % sun sensor measurement covariance (radians)
% mag_sens_std =  sqrt([2e-7;2e-7;2e-7]); %10^-6*[0.403053;0.240996;0.173209]; % magnetometer covariance (micro tesla)
mag_sens_std  = [4.03053e-07;2.40996e-07;1.73209e-07];

%%Time step that the MEKF is ran at
estimation.dt = fswParams.sample_time_s; 
dt = estimation.dt;
estimation.sample_time_s = dt;

% Process and measurement covariances
sig_v = ((sqrt(10)*1e-6));     % angle random walk Actual
sig_u = ((sqrt(6)*1e-7));    % rate random walk

Q_k = [(sig_v^2*dt + 1/3*sig_u^2*dt^3)*eye(3)   -(1/2*sig_u^2*dt^2)*eye(3); %create dynamic nnoise measurement matrix
                   -(1/2*sig_u^2*dt^2)*eye(3)              (sig_u^2*dt)*eye(3)]; 
     
%Constant Matrices sqrt form
gamma = blkdiag(-eye(3),eye(3));
Q = gamma*Q_k*gamma';
estimation.Qchol = chol(Q,'lower');

R = [(sun_sensor_std^2)*eye(3),zeros(3,3);zeros(3,3),((mag_sens_std.^2)).*eye(3)]; %create measurment error cov matrix
estimation.Rchol = chol(R,'lower');


fswParams.estimation = estimation;
clear estimation
clear sig_v sig_u sun_sensor_var mag_var zero R Beta P P_0_a P_0_b sun_sensor_std mag_sens_std dt gamma R Q Q_k P_init
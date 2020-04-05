%%%%% THIS SCRIPT SETS UP PARAMETERS AND INITIAL CONDITIONS FOR the simulink estimator
                                     
estimation = struct;

%%%% Initial Conditions %%%%%
simParams.initialConditions.w0 = [0;0.01;0.0];
% simParams.initialConditions.w0 = [-0.2;0.1;0.04];
estimation.ic.Beta_init = [0;0;0];%Initialize gyro Bias
estimation.ic.quat_est_init = [1;0;0;0]; 
simParams.initialConditions.q0 = [0.533215448243828;0.592817248117098;0.0831095662269988;0.597780725760345];
estimation.ic.quat_est_init = simParams.initialConditions.q0;
estimation.ic.w_init = [0.00;0.00;0.00];
estimation.ic.w_init=  [-0.0759758375904211;0.239973389221653;-0.0991200265923264];

%Create covariance matrix for estimate
P_0_a = 0.001;  % attitude
P_0_b = 0.0001; % bias
P_init = blkdiag(P_0_a*eye(3),P_0_b*eye(3));
estimation.ic.Pchol_init = chol(P_init,'lower');

fswParams.sample_time_s = 1/30;

sun_sensor_std = sqrt(6e-4); %0.5/(sqrt(2)*3.0); % sun sensor measurement covariance (radians)
mag_var_std =  sqrt([2e-7;2e-7;2e-7]); %10^-6*[0.403053;0.240996;0.173209]; % magnetometer covariance (micro tesla)

%%Time step that the Mestimation is ran at
% estimation.ic.P_init = 1e-10*eye(6,6);
% Process and measurement covariances

sig_v = 1e-6;     % angle random walk Actual
sig_u = 1e-6;    % rate random walk

%%Time step that the MEKF is ran at
estimation.dt = fswParams.sample_time_s; 
dt = estimation.dt;
estimation.sample_time_s = dt;

Q_k = [(sig_v^2*dt + 1/3*sig_u^2*dt^3)*eye(3)    -(1/2*sig_u^2*dt^2)*eye(3);
                   -(1/2*sig_u^2*dt^2)*eye(3)              (sig_u^2*dt)*eye(3)]; %create dynamic nnoise measurement matrix
%Constant MAtrices
gamma = blkdiag(-eye(3),eye(3));
Q = gamma*Q_k*gamma';
estimation.Qchol = chol(Q,'lower');

R = [(sun_sensor_std^2)*eye(3),zeros(3,3);zeros(3,3),((mag_var_std.^2)).*eye(3)]; %create measurment error cov matrix
estimation.Rchol = chol(R,'lower');


fswParams.estimation = estimation;
clear estimation
clear sig_v sig_u sun_sensor_var mag_var zero R Beta P P_0_a P_0_b sun_sensor_std mag_var_std dt gamma Qg R
%%%%% THIS SCRIPT SETS UP PARAMETERS AND INITIAL CONDITIONS FOR the simulink estimator

% Author: Kylle Ashton
                                              
estimation = struct;

%%%% Initial Conditions %%%%%
   
estimation.ic.Beta_init     = 0.0*[1;1;1];%Initialize gyro Bias
estimation.ic.quat_est_init = [0;0;0;1]; 
    
        P = [(0.1*pi/180)^2*eye(3) zeros(3,3);
        zeros(3,3),(0.2*pi/180/3600)*eye(3)];
        estimation.P_sq = chol(P,'lower'); %create square root form of cov matrix
estimation.ic.P_sq_init = estimation.P_sq; %initial value of cov matrix for simulink


% Process and measurement covariances
sig_v          = sqrt(10)*1e-4;% zero mean gaussian covariance of gyro process noise
sig_u          = sqrt(6)*1e-8; % gyro random walk seems to work beter and converge quicker when this is smaller than sig_v
sun_sensor_var = 0.0029/3; % sun sensor measurement covariance
mag_var        =  10^-6*[0.403053;0.240996;0.173209]; % magnetometer covariance


%%Time step that the MEKF is ran at
estimation.dt    = 0.1;
estimation.del_t = estimation.dt; % short term fix for mislabelling in code.

%Constant MAtrices
estimation.Q_k   = [(sig_v^2*estimation.dt + 1/3*sig_u^2*estimation.dt^3)*eye(3), (0.5*sig_u^2*estimation.dt^2)*eye(3);
        (0.5*sig_u^2*estimation.dt^2)*eye(3), (sig_u^2*estimation.dt)*eye(3)]; %create dynamic nnoise measurement matrix
estimation.gamma = [-eye(3),zeros(3,3);zeros(3,3),eye(3)];
estimation.Q_sq  = chol((estimation.gamma*estimation.Q_k*estimation.gamma'),'lower'); %square root dynamic noise matrix

    R = [sun_sensor_var^2*eye(3),zeros(3,3);zeros(3,3),(mag_var.^2).*eye(3)]; %create measurment error cov matrix
estimation.R_sq = chol(R,'lower');  % create square root form of measurement cov matrix  


fswParams.estimation = estimation;
clear estimation
clear sig_v sig_u sun_sensor_var mag_var zero R Beta P
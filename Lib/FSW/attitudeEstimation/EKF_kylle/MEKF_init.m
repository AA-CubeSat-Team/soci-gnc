function [fswParams,simParams] = MEKF_init(fswParams,simParams)
%MEKF_INIT
%
% Initialize parameters for the Multiplicative Extended Kalman Filter (MEKF) 
% used for attitude estimation.
%
% K. Ashton
                                     
estimation = struct;

% Initial Conditions %
% Initialize gyro bias
estimation.ic.Beta_init      = [0;0;0]; 
% Initialize quaternion initial guess
estimation.ic.quat_est_init  = [1;0;0;0]; 
% activate TRIAD on first appropriate timestep (TriadActiavtion_lib)
estimation.ic.activate_triad = 1; 

% Rate Transition Initial Conditions %
estimation.ic.sun_valid_rt          = 1;
estimation.ic.mag_valid_rt          = 1;
estimation.ic.gyro_valid_rt         = 1;
estimation.ic.sc2sun_eci_unit_rt    = [0;0;0];
estimation.ic.B_eci_unit_rt         = [0;0;0];
estimation.ic.sunsensor_body_rad_rt = [0;0;0];
estimation.ic.mag_body_rt           = [0;0;0];
estimation.ic.gyro_meas_rt          = [0;0;0];
estimation.ic.triad_input_rt        = 1; % activate this on the first iteration

% Create covariance matrix for estimate %
P_0_a = 10e-10;     % attitude
P_0_b = 10e-10;     % bias
P_init = blkdiag(P_0_a*eye(3),P_0_b*eye(3));
estimation.ic.Pchol_init = chol(P_init,'lower');

% Sensor Standard Deviations %
% sun sensor measurement std deviation (radians)
sun_sensor_std = 0.5/(sqrt(3)*3.0)*pi/180; 
% magnetometer std deviation (micro tesla)
mag_sens_std   = ([4.0305e-07;2.4100e-07;1.7321e-07]);

% Time step that the MEKF is ran at %
dt = 1/10;
estimation.dt = dt; 
estimation.sample_time_s = dt;

% Process and measurement covariances %
sig_v = ((sqrt(10)*1e-6));  % angle random walk 
sig_u = ((sqrt(6)*1e-7));   % rate random walk

% Create dynamic noise measurement matrix %
Q_k = [ (sig_v^2*dt + 1/3*sig_u^2*dt^3)*eye(3)   -(1/2*sig_u^2*dt^2)*eye(3);
          -(1/2*sig_u^2*dt^2)*eye(3)              (sig_u^2*dt)*eye(3) ]; 
     
% Constant matrices for the sqrt form %
gamma = blkdiag(-eye(3),eye(3));
% time propagation dynamic noise matrix
Q = gamma*Q_k*gamma'; 
estimation.Qchol = chol(Q,'lower'); 
% create measurment error cov matrix
R = [(sun_sensor_std^2 )*eye(3),zeros(3,3);zeros(3,3),((mag_sens_std.^2)).*eye(3)]; 
estimation.Rchol = chol(R,'lower');

% Add to main struct %
fswParams.estimation = estimation;

end
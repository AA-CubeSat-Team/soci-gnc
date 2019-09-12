% AA528 
%
% Frequency Domain Design Problem - Simulink Component
clear variables; close all

% load control gains
load('control_gains.mat')

% spacecraft inertia & disturbance torque
J       = diag([0.12,0.11,0.0346]);
tau_d   = 1e-6;

% simulate the model
sim_params.quat_ref  = [ 1.0; 0.0; 0.0; 0.0 ];
sim_params.ang_ref   = zeros(3,1);
sim_params.omega_ref = zeros(3,1);
sim_params.ic.quaternion  = Q_rand(4);
sim_params.ic.omega_radps = zeros(3,1);
sim_params.ic.rw_momentum = zeros(3,1);
sim_params.inertia = J;
sim_params.tau_d = tau_d .* [ 0.72638; 0.49196; 0.47994 ];
sim_params.Kp = KP;
sim_params.Kd = KD;
sim_params.Ki = KI;
function [fswParams,simParams] = actuators_init(fswParams,simParams)
%ACTUATORS_INIT
%
% Define the parameters used by the actuator models in the SIM.
%
% C. Morgan | T. P. Reynolds

actuators = struct;
actuators.sample_time_s = simParams.sample_time_s;

%% Reaction Wheel Assembly
rwa = struct;
rwa.num_wheels = 4;

% Physical properties
    % estimated from spec sheet using:
    % cvx_begin sdp
    %     variable J(4,4) diagonal
    %     variable g1 nonnegative
    %     variable g2 nonnegative
    %     minimize( g1 + g2 )
    %     norm(hw1-A*J*O1) <= g1;
    %     norm(hw2-A*J*O2) <= g2;
    % cvx_end
rwa.inertia   = diag([ 2.9526e-5; 2.9526e-5; 2.9526e-5; 2.9526e-5 ]);
rwa.time_cnst = [ 0.01; 0.01; 0.01; 0.01 ];
rwa.cant_angle = 23 * simParams.constants.convert.DEG2RAD; % rad 

% mapping from wheel frame to body frame ( body = Aw * wheel )
cb = cos(rwa.cant_angle);
sb = sin(rwa.cant_angle);
rwa.Aw = [ cb    0   -cb    0;
            0   cb     0  -cb;
           sb   sb    sb   sb ];

% motor transfer functions
num1         = [ rwa.inertia(1,1), 0 ];
num2         = 1.0;
den          = [ rwa.time_cnst(1), 1 ];
sys_cont1    = tf(num1, den); % TF for omega -> dot{h}_w 
sys_cont2    = tf(num2, den); % TF for omega_cmd -> omega
sys_disc1    = c2d(sys_cont1,actuators.sample_time_s, 'zoh'); 
sys_disc2    = c2d(sys_cont2,actuators.sample_time_s, 'zoh');
rwa.tf_num1  = sys_disc1.Numerator{1};
rwa.tf_den1  = sys_disc1.Denominator{1};
rwa.tf_num2  = sys_disc2.Numerator{1};
rwa.tf_den2  = sys_disc2.Denominator{1};

% motor controller params - tuned with PID tool. Discrete time PID for omega 
% to torque
rwa.control.kp             = 0.111;
rwa.control.ki             = 2.25;
rwa.control.kd             = 0;
rwa.control.filter_coeff   = 100;
rwa.control.setpt_weight_b = 1;
rwa.control.setpt_weight_c = 1;

% bounding properties
rwa.max_RPM        = 6500;   % RPM
rwa.max_RADPS      = simParams.constants.convert.RPM2RPS * rwa.max_RPM;
rwa.max_torque_Nm  = 3.2e-3; % max torque per wheel

% power calculation parameters
rwa.visc_fric_coef = rwa.max_torque_Nm / rwa.max_RADPS; % [N-m-s/rad]
rwa.stall_torque   = rwa.max_torque_Nm;
rwa.mech_eff       = 1.452; %.182; % 18 percent efficient. 
                            % (1/4)*stall_torque*Max_Rpm = 3 Watts*eff
                            % eff = .182
                           
% variance to simulate wheel jitter
rwa.rpm_variance   = (1/3)^2;   % amounts to 3sigma about +- 1 rpm 

% initial conditions
simParams.initialConditions.rwa.rpm = [ 1000; -1000; 1000; -1000 ];
simParams.initialConditions.rwa.radps = simParams.constants.convert.RPM2RPS ...
                                    * simParams.initialConditions.rwa.rpm;
simParams.initialConditions.rwa.h_wheel_Nms = rwa.inertia ...
                                    * simParams.initialConditions.rwa.radps;
h_body_Nms = rwa.Aw * simParams.initialConditions.rwa.h_wheel_Nms; 
simParams.initialConditions.rwa.h_body_Nms = h_body_Nms(1:3);
simParams.initialConditions.rwa.power_W  = zeros(rwa.num_wheels,1);
simParams.initialConditions.rwa.torque_wheel_Nm = zeros(rwa.num_wheels,1); 
torque_body_Nm = rwa.Aw * simParams.initialConditions.rwa.torque_wheel_Nm;
simParams.initialConditions.rwa.torque_body_Nm = torque_body_Nm(1:3); 
simParams.initialConditions.rwa.rt1     = 0;
simParams.initialConditions.rwa.deriv1  = 0;

% Add minimal stuff required for FSW version of the rwa struct
rwa_fsw = struct;
rwa_fsw.inertia         = rwa.inertia;
rwa_fsw.inv_inertia     = eye(rwa.num_wheels)/rwa.inertia;
rwa_fsw.max_torque_Nm   = rwa.max_torque_Nm;
rwa_fsw.max_RPM         = rwa.max_RPM;
rwa_fsw.A               = rwa.Aw(1:3,:);
rwa_fsw.targ_rpm        = [ 1000; -1000; 1000; -1000 ];

% add to actuators struct
actuators.rwa = rwa;

%% Magnetorquers (MTQ)
mtq = struct;

% body frame normal vectors of each mtq coil
mtq.normals = [  1, 0, 0;
                -1, 0, 0;
                 0, 1, 0;
                 0,-1, 0;
                 0, 0, 1 ];
             
% get the number of coils contributing to control about each body face, 
% and the indices of the corresponding coil normal vectors in mtq.normals 
mtq.n_coils = [ sum(abs(mtq.normals(:,1))); ...
                sum(abs(mtq.normals(:,2))); 
                sum(abs(mtq.normals(:,3))) ];
mtq.id_x = find(mtq.normals(:,1));
mtq.id_y = find(mtq.normals(:,2));
mtq.id_z = find(mtq.normals(:,3));

% max dipoles
mtq.max_dipoles_Am2 = [0.0515;0.0515;0.131]; % per axis

% electric characteristics (per axis)
mtq.voltage     = [ 5; 5; 3.3 ];                        % V
mtq.max_current = [ 0.216; 0.216; 0.078 ];              % A
mtq.P_max_W     = mtq.voltage .* mtq.max_current;       % W
mtq.dipole_to_power = mtq.P_max_W./mtq.max_dipoles_Am2; % map dipole to power

% noise characteristics
mtq.noise       = 1;                            % 0 = no noise, 1 = added noise
mtq.variance    = 0.001 .* mtq.max_dipoles_Am2; % variance of cmd is 0.1%
mtq.seed        = [ 101; 102; 103 ];            % seeds for RNG

% add mtq to actuators struct
actuators.mtq = mtq;

% add actuators struct to both fsw and sim params
simParams.actuators = actuators; 
fswParams.rwa = rwa_fsw;

end
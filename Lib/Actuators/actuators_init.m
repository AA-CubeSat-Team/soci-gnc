actuators = struct;
actuators.sample_time_s = simParams.sample_time_s;

% Reaction Wheel Assembly (RWA)
rwa               = struct;
rwa.num_wheels    = 4;
rwa.sample_time_s = simParams.sample_time_s;

% estimated from spec sheet using:
% cvx_begin sdp
%     variable J(4,4) diagonal
%     variable g1 nonnegative
%     variable g2 nonnegative
%     minimize( g1 + g2 )
%     norm(hw1-A*J*O1) <= g1;
%     norm(hw2-A*J*O2) <= g2;
% cvx_end
rwa.inertia   = [ 2.9526e-5; 2.9526e-5; 2.9526e-5; 2.9526e-5 ];
rwa.time_cnst = [ 0.01; 0.01; 0.01; 0.01 ];

% Wheel Characteristics
rwa.max_RPM        = 6500;   % RPM
rwa.max_RADPS      = simParams.constants.convert.RPM2RPS * rwa.max_RPM;
rwa.max_torque_Nm  = 3.2e-3; % max torque per wheel
rwa.nominal_rpm    = [1000; -1000; 1000; -1000]; % RPM. in nullspace

rwa.visc_fric    = 1e-6;    % WAG
rwa.torque_cnst  = 1e-3;    % Nm/A WAG
rwa.delay        = 0;       % s WAG
rwa.resistance   = 1;       % Ohms WAG
rwa.inductance   = 1e-6;    % Henry WAG

rwa.inertia_matrix      = diag(rwa.inertia);
rwa.inv_inertia_matrix  = inv(rwa.inertia_matrix);
rwa.dc_voltage          = 5; % V
rwa.cant_angle          = 23 * simParams.constants.convert.DEG2RAD; % rad 

% torque allocation matrix
cb = cos(rwa.cant_angle);
sb = sin(rwa.cant_angle);
rwa.Aw = [ cb    0   -cb    0;
            0   cb     0  -cb;
           sb   sb    sb   sb;
            1   -1     1   -1 ];
rwa.iAw = inv(rwa.Aw);

% Initial conditions
rwa.ic.rpm              = 1.0*[1000;-1000;1000;-1000];
rwa.ic.rpm              = 1.0*[4300;-3400;2000;-3000];
% rwa.ic.rpm              = 0*[3600;4400;2000;3000];
rwa.ic.radps            = simParams.constants.convert.RPM2RPS * rwa.ic.rpm;
rwa.ic.momentum         = rwa.inertia_matrix ...
                      * (simParams.constants.convert.RPM2RPS * rwa.ic.rpm);
body_momentum           = rwa.Aw * rwa.ic.momentum; % about body axes
rwa.ic.body_momentum    = body_momentum(1:3);
rwa.ic.power_W          = zeros(rwa.num_wheels,1);
rwa.ic.torque_Nm        = zeros(rwa.num_wheels,1); % about wheel axes
body_torque_Nm          = rwa.Aw * rwa.ic.torque_Nm;
rwa.ic.body_torque_Nm   = body_torque_Nm(1:3); % about body axes
rwa.ic.rt1              = 0;
rwa.ic.deriv1           = 0;

% % Motor transfer functions
% num  = rwa.torque_cnst;
% den  = [ rwa.inertia*rwa.inductance ...
%          rwa.inductance*rwa.visc_fric + rwa.resistance*rwa.inertia ...
%          rwa.resistance*rwa.visc_fric + rwa.torque_cnst^2 ];
% num2 = [ rwa.inertia rwa.visc_fric ];            
% sys_c           = tf(num,den);   % TF for V to Omega
% sys_c2          = tf(num2,den);  % TF for V to I
% sys_d           = c2d(sys_c,rwa.sample_time_s); 
% sys_d2          = c2d(sys_c2,rwa.sample_time_s); 
% rwa.tf_num      = sys_d.Numerator{1};
% rwa.tf_den      = sys_d.Denominator{1};
% rwa.tf_V2I_num  = sys_d2.Numerator{1};
% rwa.tf_V2I_den  = sys_d2.Denominator{1};
% clear num den num2 sys_c sys_c2 sys_d sys_d2

% Continuos time PID
% rwa.control.kp              = 1.3375803137951;
% rwa.control.ki              = 267.355364694592;
% rwa.control.kd              = -0.000485758916096801;
% rwa.control.filter_coeff    = 378.094165182863;
% rwa.control.setpt_weight_b  = 0.0302538537839731;
% rwa.control.setpt_weight_c  = 0.220333136002326;

% % Motor transfer functions
num1         = [rwa.inertia(1) 0];
den          = [rwa.time_cnst(1) 1];
num2         = [1];
sys_cont1    = tf(num1, den); % TF for omega -> dot{h}_w 
sys_cont2    = tf(num2, den); % TF for omega_cmd -> omega
sys_disc1    = c2d(sys_cont1,rwa.sample_time_s, 'foh'); 
sys_disc2    = c2d(sys_cont2,rwa.sample_time_s, 'foh');
rwa.tf_num1  = sys_disc1.Numerator{1};
rwa.tf_den1  = sys_disc1.Denominator{1};
rwa.tf_num2  = sys_disc2.Numerator{1};
rwa.tf_den2  = sys_disc2.Denominator{1};
clear num1 den num2 sys_cont1 sys_cont2 sys_disc1 sys_disc2

% % Control Params - tuned with PID tool
% Discrete time PID for V to I
% rwa.control.kp              = 0.1;
% rwa.control.ki              = 0.02;
% rwa.control.kd              = 0;
% rwa.control.filter_coeff    = 50;
% rwa.control.setpt_weight_b  = 1;
% rwa.control.setpt_weight_c  = 1;

% % Control Params - tuned with PID tool
% Discrete time PID for omega to torque
rwa.control.kp              = 0.111;
rwa.control.ki              = 2.25;
rwa.control.kd              = 0;
rwa.control.filter_coeff    = 100;
rwa.control.setpt_weight_b  = 1;
rwa.control.setpt_weight_c  = 1;


actuators.rwa = rwa;

% Magnetorquers (MTQ)
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
mtq.tot_coils = sum(mtq.n_coils);
mtq.id_x  = find(mtq.normals(:,1));
mtq.id_y  = find(mtq.normals(:,2));
mtq.id_z  = find(mtq.normals(:,3));

% max dipoles
mtq.dipoles_Am2    = [0.0515;0.0515;0.131];           % per individual coil
mtq.dipole_max_Am2 = mtq.dipoles_Am2;% diag(mtq.n_coils) * mtq.dipoles_Am2;      % axes total

% electric characteristics (per coil)
mtq.voltage     = [5;5;3.3];                        % V
mtq.max_current = [0.216;0.216;0.078];              % A
mtq.P_max_W     = mtq.voltage .* mtq.max_current;   % W

% digital value to drive each coil [0 mtq.dig_val] <=> [0 m_max]
mtq.dc_max = 100;
mtq.m_2_dc = mtq.dc_max./mtq.dipole_max_Am2;
mtq.dc_2_m = 1.0./mtq.m_2_dc;

% ratios to map dipole to power (per coil)
mtq.dipole_to_power = mtq.P_max_W./mtq.dipoles_Am2;

% add mtq to actuators struct
actuators.mtq = mtq;

% add actuators struct to both fsw and sim params
simParams.actuators = actuators; 
fswParams.actuators = actuators;

clear rwa mtq
clear actuators body_momentum body_torque_Nm cb sb;
% Initializes the magnetic desaturation test. Start the wheels saturated,
% or not saturated, and see that the controller drives the wheels to the
% value set in nominal_rpm
%
% first run Sim_init
%
% Author: Cole Morgan


% Reaction Wheel Assembly (RWA)
rwa               = struct;
% rwa.num_wheels    = 4;
% rwa.sample_time_s = simParams.sample_time_s;

rwa.inertia   = [ 2.9526e-5; 2.9526e-5; 2.9526e-5; 2.9526e-5 ];
rwa.time_cnst = [ 0.01; 0.01; 0.01; 0.01 ];

% Wheel Characteristics
rwa.max_RPM        = 6500;   % RPM
rwa.max_RADPS      = simParams.constants.convert.RPM2RPS * rwa.max_RPM;
rwa.max_torque_Nm  = 3.2e-3; % max torque per wheel
rwa.nominal_rpm    = [1000; -1000; 1000; -1000]; % RPM. in nullspace

rwa.inertia_matrix      = diag(rwa.inertia);
rwa.inv_inertia_matrix  = inv(rwa.inertia_matrix);



% Initial conditions
rwa.ic.rpm              = 1.0*[1000;-1000;1000;-1000];
rwa.ic.rpm              = 1.0*[4600;-3400;2000;-3000];
% chosen "randomly" with at least 1 above the saturation limit of 4500rpm.
% this needs to be a fsw params as well bc the controller cannot specify
% the correct rpm command if it has the wrong value. 
rwa.ic.radps            = simParams.constants.convert.RPM2RPS * rwa.ic.rpm;
rwa.ic.momentum         = rwa.inertia_matrix ...
                      * (simParams.constants.convert.RPM2RPS * rwa.ic.rpm);
                  
simParams.actuators.rwa.ic.rpm      = rwa.ic.rpm;
simParams.actuators.rwa.ic.radps    = rwa.ic.radps;
simParams.actuators.rwa.ic.momentum = rwa.ic.momentum;
fswParams.actuators.rwa.ic.rpm      = rwa.ic.rpm;
fswParams.actuators.rwa.ic.radps    = rwa.ic.radps;
fswParams.actuators.rwa.ic.momentum = rwa.ic.momentum;

% momentum target. NOTICE these are not SI units of momentum. that is
% becuase it is much more intuitive to think of this target in terms of rpm not rad per sec. 
fswParams.controllers.desaturation.ht = simParams.actuators.rwa.inertia_matrix*rwa.nominal_rpm;
                  
                  


clear rwa nominal_rate
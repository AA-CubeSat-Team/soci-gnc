function [fswParams,simParams] = desaturation_init(fswParams,simParams)
%DESATURATION_INIT
% 
% Initialization of the Desaturation controller
% Largely follows the outline from Spacecraft Dynamics and Control
% Marcel Sidi section 7.5
%
% C. Morgan

% controllers = struct;
desaturation = struct;

% unloading control gain. chosen as this because it seems to make things
% work well. probably some function of the max dipole vs
% torque required to drive rwa, but this is just by running a few times and 
% making a judgement call. too large and we
% are just always saturating the mtq. too small and
% the rwa will take forever to desat. The reason this number is not just
% set to 1000 or something large is so that the rwa rpms do not develope
% oscillations around their setpoint making it easier to see when the desat
% mode should be over.
desaturation.k = 1.0; %1/1000; 

% start reducing gain when rpm error becomes less than about 400 rpm.
desaturation.gain_tol = 400 * fswParams.constants.convert.RPM2RPS ...
                            * simParams.actuators.rwa.inertia(1,1);
                        
% when error low, try to smoothly reduce rpms further.
desaturation.k2 = 0.125; 

% general strength of earth mag field [for testing only]
B = 3.12*10^-5;
desaturation.B = B;
B_vec = [1;1;1];
% assuming some constant B field in all directions for testing.
desaturation.B_vec = B*B_vec/norm(B_vec); 
                                        
% >>> Taylor: are these things needed? Seems like we're re-creating
% variables. Max dipole is also axis-dependent. 
m = simParams.actuators.mtq.max_dipoles_Am2(1);
desaturation.maxDipole = m; % [Am2] max dipole our magtorquers can generate. 
desaturation.T         = diag([1/m; 1/m; 1/m; 1/m; 1/(2*m)]);
Jw = simParams.actuators.rwa.inertia(1,1); % [kgm2] inertia of the individual wheels.
desaturation.Jw = Jw;

% make this steady-state wheel speed dependent on allocation null space?
ss_rate_rpm = 1000*[ 1; -1; 1; -1 ]; 
ss_rate_radps = simParams.constants.convert.RPM2RPS * ss_rate_rpm;
% create an angular momentum target
desaturation.ht_Nms = Jw*ss_rate_radps; % [Nms] 

% limits how quickly spindown happens. limits power consumption
% and limits oscillations once at nominal rpm but not out of desat.
desaturation.spindown_torque_Nm = 0.01 * simParams.actuators.rwa.max_torque_Nm;

% sets limit on max angular momentum error of wheels in body frame to begin
% spindown. too high, wheel rpms wont be in null space. too low,
% you might get stuck oscillating about the nullspace.
desaturation.spindown_tol = (400 * simParams.constants.convert.RPM2RPS) ...
                                 * simParams.actuators.rwa.inertia(1,1); 

% add to main struct
fswParams.controllers.desaturation = desaturation;

end
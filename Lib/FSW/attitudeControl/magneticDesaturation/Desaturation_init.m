% Initialization of the Desaturation controller
% Largely follows the outline from Spacecraft Dynamics and Control
% Marcel Sidi section 7.5
%
%
% Author: Cole Morgan


% controllers = struct;
desaturation = struct;

desaturation.k = 1; %1/1000; 
% unloading control gain. chosen as this because it seems to make things
% work well. probably some function of the max dipole vs
% torque required to drive rwa, but this is just by running a few times and 
% making a judgement call. too large and we
% are just always saturating the mtq. too small and
% the rwa will take forever to desat. The reason this number is not just
% set to 1000 or something large is so that the rwa rpms do not develope
% oscillations around their setpoint making it easier to see when the desat
% mode should be over.

B = 3.12*10^-5; % general strength of earth mag field. for testing.
desaturation.B = B;
B_vec = [1;1;1];
desaturation.B_vec = B*B_vec/norm(B_vec); % assuming some constant B field in 
                                        % all directions for testing.
m = 0.0515;
desaturation.maxDipole = m; %A-m2 max dipole our magtorquers can generate. 
desaturation.T         = diag([1/m; 1/m; 1/m; 1/m; 1/(2*m)]);
Jw = 2.94*10^-5; %kg-m2 inertia of the individual wheels.
desaturation.Jw = Jw;
% ss_rate = 1000*[1;1;1;1]; % 1000 rpm rate for each wheel is the target.
ss_rate = 1000*[1, -1, 1, -1]; % make this dependent on null space?
% ss_rate = 1000*[1; -1; 0; 0]; % actually make this **perpendicular** to the null space.
desaturation.ht = Jw*ss_rate; % now an angular momentum target. NOT kg-m2/s !!

fswParams.controllers.desaturation = desaturation;

clear desaturation 
clear Jw ss_rate B B_vec m
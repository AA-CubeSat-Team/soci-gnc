% Initialization of the Desaturation controller
% Largely follows the outline from Spacecraft Dynamics and Control
% Marcel Sidi section 7.5
%
%
% Author: Cole Morgan


% controllers = struct;
desaturation = struct;

desaturation.k = 1; % unloading control gain
B = 3.12*10^-5; % general strength of earth mag field. for testing.
desaturation.B = B;
B_vec = [1;1;1];
desaturation.B_vec = B*B_vec/norm(B_vec); % assuming some constant B field in 
                                        % all directions for testing.

desaturation.maxDipole = 0.0515; %A-m2 max dipole our magtorquers can generate.
Jw = 2.94*10^-5; %kg-m2 inertia of the individual wheels.
desaturation.Jw = Jw;
% ss_rate = 1000*ones(4, 1); % 1000 rpm rate for each wheel is the target.
ss_rate = 1000*[1, -1, 1, -1]; % make this dependent on null space?
desaturation.ht = Jw*ss_rate; % now an angular momentum target. NOT kg-m2/s !!

fswParams.controllers.desaturation = desaturation;

clear desaturation 
clear Jw ss_rate B B_vec
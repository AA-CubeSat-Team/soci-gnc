% Initialization of the Detumbling controller
% Largely follows the design and methodology in "Feedback control logic for 
% eigenaxis rotations under slew rate and control constraints"
%
%
% Author: Cole Morgan


% controllers = struct;
stabilize   = struct;
J       = fswParams.scParams.J;
wn      = 0.5;
zeta    = sqrt(2)/2;
stabilize.C = 2*zeta*wn*J;

fswParams.controllers.stabilize = stabilize;

clear stabilize 
clear J wn zeta
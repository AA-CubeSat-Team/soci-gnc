function [fswParams,simParams] = asmController_init(fswParams,simParams)
%ASMCONTROLLER_INIT
%
% Initialization of the Attitude Stabilization Mode Controller.
% Largely follows the design and methodology in "Feedback control logic for 
% eigenaxis rotations under slew rate and control constraints"
%
% C. Morgan

asm   = struct;
J     = fswParams.scParams.J;
wn    = 0.5;
zeta  = sqrt(2)/2;
asm.C = 2*zeta*wn*J;

fswParams.controllers.asm = asm;

end
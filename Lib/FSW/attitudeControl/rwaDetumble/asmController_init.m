function [fswParams,simParams] = asmController_init(fswParams,simParams)
%ASMCONTROLLER_INIT
%
% Initialization of the Attitude Stabilization Mode Controller.
% Largely follows the design and methodology in "Feedback control logic for 
% eigenaxis rotations under slew rate and control constraints"
%
% - Update Dec. 11, 2020 [TPR] : input is now the ang. vel. error, defined by 
%       w_err == w_cmd - w
%   so the gain needs to be NEGATIVE now as a result.
%
% C. Morgan | T. P. Reynolds

asm   = struct;
J     = fswParams.scParams.J;
wn    = 0.25;
zeta  = sqrt(2)/2;
% keep this value negative
asm.C = -2*zeta*wn*J;

fswParams.controllers.asm = asm;

end
function [fswParams,simParams] = desatcontrollerParams_init(fswParams,simParams)
%DESATCONTROLLERPARAMS_INIT
%
% Initialize desat controller parameters. 
%%%%%Last sync with SOC-i's CAD model: 
% Created on:
%   April 8th, 2021
%
% S. Kim

desatcontrollerParams = struct;

%%make 3x1 vector, multiply by component
% DO NOT CHANGE TO NEGATIVE VALUES
desatcontrollerParams.gain = 100*[2e-5 0 0; 0 2e-5 0; 0 0 2e-5];


% add to main structs
fswParams.desatcontrollerParams = desatcontrollerParams;

end
 

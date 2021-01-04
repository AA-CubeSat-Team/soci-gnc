function [fswParams,simParams] = pdController_init(fswParams,simParams)
%PDCONTROLLER_INIT 
%
% Initialization of the pd controller
% Each Controller is found from a basic 1st order TF
%
% D. Tormey

tracking = struct;

load('../Include/pdController.mat','pdController');

tracking.Kd = pdController.Kd;
tracking.Kp = pdController.Kp;
tracking.qd =[1;0;0;0];

% add to main struct
fswParams.controllers.tracking = tracking;

end
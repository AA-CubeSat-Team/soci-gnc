% Initialization of the pd controller
% Each Controller is found from a basic 1st order TF
% Author: Devan Tormey

controllers = struct;

SlewAndControlConstrained_init; %controller1
Detumbling_init; %controller2
pdController_init; %controller3

%fswParams.controllers = controllers;

clear controllers
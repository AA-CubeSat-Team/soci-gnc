% Initialization of various control schemes
%
% Author: Cole Morgan

controllers = struct;

SlewAndControlConstrained_init; %controller1
Detumbling_init; %controller2
pdController_init; %controller3

%fswParams.controllers = controllers;

clear controllers
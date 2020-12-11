function [fswParams,simParams] = controllers_init(fswParams,simParams)
%CONTROLLERS_INIT
%
% Initialize the parameters used by each controller
%
% C. Morgan

% stabilization mode controller -- first one uses MTQ, second one uses the RWA
% [fswParams,simParams] = bdotController_init(fswParams,simParams);
[fswParams,simParams] = asmController_init(fswParams,simParams);

% (point-to-point) reorientation controller
[fswParams,simParams] = SlewAndControlConstrained_init(fswParams,simParams);

% tracking controller
[fswParams,simParams] = pdController_init(fswParams,simParams);

% desaturation controller. MTQ desats RWA
[fswParams,simParams] = desaturation_init(fswParams,simParams);

% sun seeking controller
[fswParams,simParams] = sunSeek_init(fswParams,simParams);

end
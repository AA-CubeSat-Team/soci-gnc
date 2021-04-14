function [fswParams,simParams] = sunSeek_init(fswParams,simParams)
%SUNSEEK_INIT
%
% Initialization of the Sun seeking controller.
%
% T. P. Reynolds
sunseek = struct;

% max photodiode current & threshold value
sunseek.I_max_uA    = simParams.sensors.photodiodes.max_current_uA;
sunseek.I_thresh_uA = sunseek.I_max_uA * cosd(40)^2;

% controller gain
J       = fswParams.scParams.J;
wn      = 0.1;
zeta    = 0.9;
sunseek.Kp = wn^2.*J;
sunseek.Kd = 2*zeta*wn.*J; % keep this value negative

fswParams.controllers.sunseek = sunseek;

end
function [fswParams,simParams] = sunSeek_init(fswParams,simParams)
%SUNSEEK_INIT
%
% Initialization of the Sun seeking controller.
%
% T. P. Reynolds
sunseek = struct;

% max photodiode current & threshold value
sunseek.I_max_A = simParams.sensors.photodiodes.I_out_ApW ...
                        * simParams.sensors.solar_panels.maxPower;
sunseek.I_thresh_A = sunseek.I_max_A * cosd(40)^2;

% controller gain
J       = fswParams.scParams.J;
wn      = 0.1;
zeta    = 0.9;
sunseek.Kp = wn^2.*J;
sunseek.Kd = 2*zeta*wn.*J; % keep this value negative

fswParams.controllers.sunseek = sunseek;

end
function [fswParams,simParams] = solarPressure_init(fswParams,simParams)
%SOLARPRESSURE_INIT
%
% Solar Pressure Initialization
%
% D. Tormey

solarPressure = struct;
solarPressure.psrp = 4.57e-6; % N/m2

simParams.solarPressure = solarPressure;

end


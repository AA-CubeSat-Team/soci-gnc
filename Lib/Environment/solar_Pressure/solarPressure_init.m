% Solar Pressure Initialization
% Author Devan Tormey
% Description: Create variables for running the atmospheric drag model.


solarPressure = struct;

solarPressure.psrp = 4.6*10^(-6);



simParams.solarPressure = solarPressure;
clear solarPressure


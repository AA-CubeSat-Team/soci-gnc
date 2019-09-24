%INIT_SOLAR_PANELS   
%
% Sim solar panel model init file -- copied over to sensors_init.m for now.
%
% T. Reynolds

solar_panels = struct;

solar_panels.faces    = [ 1 -1  0  0  0  0;
                          0  0  1 -1  0  0;
                          0  0  0  0  1 -1 ];
solar_panels.eff      = 0.9;
solar_panels.maxPower = [ 4.238; 4.238; 5.298; 5.298; 2.400; 0.0 ];
solar_panels.maxPower = solar_panels.eff .* solar_panels.maxPower;
solar_panels.num      = sum(solar_panels.maxPower>0);

simParams.sensors.solar_panels = solar_panels;
clear solar_panels
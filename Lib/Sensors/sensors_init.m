
sensors = struct;
sensors.sample_time_s = 0.1;

%% Magnetometer

% TBD

%% Gyroscope

% TBD

%% Sun sensor

% TBD

%% Solar panels
solar_panels = struct;

solar_panels.normals  = [ 1 -1  0  0  0  0;
                          0  0  1 -1  0  0;
                          0  0  0  0  1 -1 ];
solar_panels.eff      = 0.9;
solar_panels.maxPower = [ 4.238; 4.238; 5.298; 5.298; 2.400; 0.0 ];
solar_panels.maxPower = solar_panels.eff .* solar_panels.maxPower;
solar_panels.num      = sum(solar_panels.maxPower>0);

sensors.solar_panels = solar_panels;
clear solar_panels;

%% Attach sensors to simParams and clear things
simParams.sensors = sensors;
clear sensors;
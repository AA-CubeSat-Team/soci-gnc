sensors = struct;
sensors.sample_time_s = 0.1;

%% Magnetometer
mag = struct;

% initialize three magnetometers
mag.N_mag = 3;

% set common sample time
mag.sample_time_s = (1/20);

% set initial conditions in rate transitions/blocks
mag.ic.B_eci_T = [1e-9;0;0];

% toggle sensor noise
mag.noise = [ true; true; true ];

% loop through each sensor to set sensor specific values
for k = 1:mag.N_mag
   % set different seeds so that each sensor has different noise values
   mag.seed{k} = 10*(k-1)+1;
   % set noise characterisitics (assumed from HMC5993 for now)
   mag.err{k} = [ 2e-7; 2e-7; 2e-7 ]; 
   % set sensor resolution (WAG)
   mag.resolution{k} = 1e-8;
   % set linear range of sensor
   mag.B_min{k} = -2e-4;   % T
   mag.B_max{k} =  2e-4;   % T
end

sensors.mag = mag;
clear mag

%% Gyroscope
gyro = struct;

% initialize three gyroscopes
gyro.N_gyro = 3;

% set common sample time
gyro.sample_time_s = (1/40);

% loop through each sensor to set sensor specific values
for k = 1:gyro.N_gyro
   % set different seeds so that each sensor has different noise values
   gyro.seed_arw{k} = [ 10*(k-1)+1; 10*(k-1)+2; 10*(k-1)+3 ];
   gyro.seed_rrw{k} = [ 10*(k+2)+1; 10*(k+2)+2; 10*(k+2)+3 ];
   % set noise characterisitics 
   gyro.arw{k} = sqrt(10)*1e-7;     % angle random walk
   gyro.rrw{k} = sqrt(10)*1e-10;    % rate random walk
   % set sensor resolution (Bosch BMI055)
   gyro.resolution{k} = simParams.constants.convert.DEG2RAD * 0.004;
   % set initial bias
   gyro.bias{k} = 0.1*(1/3600)*(pi/180)*[1; 1; 1]; 
   % set range of sensor
   gyro.w_min{k} = -simParams.constants.convert.DEG2RAD * 125;   % rad/s
   gyro.w_max{k} =  simParams.constants.convert.DEG2RAD * 125;   % rad/s
end

sensors.gyro = gyro;
clear gyro


%% Sun sensor

% TBD

%% Solar panels
solar_panels = struct;

solar_panels.normals  = [ 1 -1  0  0  0  0
                          0  0  1 -1  0  0
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
function [fswParams,simParams] = sensors_init(fswParams,simParams)
%SENSORS_INIT
%
% Initialization of the sensors, including magnetometer, gyroscopes, sun
% sensor, solar panels and photodiodes.
%
% Author: T. P. Reynolds

sensors = struct;
sensors.sample_time_s = simParams.sample_time_s;

%% Magnetometer
mag = struct;

% initialize three magnetometers
mag.N_mag = 3;

% set common sample time
% mag.sample_time_s = (1/20);
mag.sample_time_s = simParams.sample_time_s;

% set initial conditions in rate transitions/blocks
mag.ic.B_eci_T = [1e-9;0;0];

% toggle sensor noise
mag.noise = [ true; true; true ];

% loop through each sensor to set sensor specific values
for k = 1:mag.N_mag
   % set different seeds so that each sensor has different noise values
   mag.seed(k) = 10*(k-1)+1;
   % set noise characterisitics (assumed from HMC5993 for now)
   mag.err_T(:,k) = 10^-6*[0.403053;0.240996;0.173209]; % T
   % set linear range of sensor
   mag.B_min_T(k) = -2e-4;   % T
   mag.B_max_T(k) =  2e-4;   % T
end

sensors.mag = mag;

%% Gyroscope
gyro = struct;

% initialize three gyroscopes
gyro.N_gyro = 3;

% set common sample time
% gyro.sample_time_s = (1/40);
gyro.sample_time_s = simParams.sample_time_s;

% loop through each sensor to set sensor specific values
for k = 1:gyro.N_gyro
   % set different seeds so that each sensor has different noise values
   gyro.seed_arw(:,k) = (11*(k-1)+(1:gyro.N_gyro))';
   gyro.seed_rrw(:,k) = (10*(k+2)+(1:gyro.N_gyro))';
   % set noise characterisitics 
   gyro.arw(k) = sqrt(10)*1e-7;     % angle random walk
   gyro.rrw(k) = sqrt(10)*1e-10;    % rate random walk
   % set sensor resolution (Bosch BMI055)
   gyro.resolution(k) = simParams.constants.convert.DEG2RAD * 0.004;
   % set initial bias
   gyro.bias_init(:,k) = 0.1*(1/3600)*(pi/180)*[1; 1; 1]; 
   % set range of sensor
   gyro.w_min(k) = -simParams.constants.convert.DEG2RAD * 125;   % rad/s
   gyro.w_max(k) =  simParams.constants.convert.DEG2RAD * 125;   % rad/s
end

sensors.gyro = gyro;

%% Sun sensor
sun_sensor = struct;

% set sample time
% sun_sensor.sample_time_s = (1/20); % 
sun_sensor.sample_time_s = simParams.sample_time_s;

% body frame to sensor frame rotation matrices
sun_sensor.body2ss = [ -1.0, 0.0, 0.0;
                        0.0, 0.0, 1.0;
                        0.0, 1.0, 0.0 ];
sun_sensor.ss2body = sun_sensor.body2ss';

% toggle sensor noise
sun_sensor.noise = true;
                       
% degree variance: 0.5 is total 3sigma bound, split between two angles
sun_sensor.deg_var = 0.5/(sqrt(2)*3.0);

% set (arbitrarily chosen) noise seeds
sun_sensor.seed = [ 101; 102 ];

% set field of view
sun_sensor.range_deg = 60;

sensors.sun_sensor = sun_sensor;

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

%% Photodiodes
photodiodes = struct;

% maximum output current as a function of incident solar power
photodiodes.I_out_ApW = 0.55; % A/W

% define cutoff above which we say there is incidence. Take 50% of maximum
% output current -- this says that unless the photodiode is outputting more
% than 50% of its max current, we ignore the reading when deciding sun
% direction using this sensor
photodiodes.I_cutoff_A = (0.5*photodiodes.I_out_ApW).*sensors.solar_panels.maxPower;

sensors.photodiodes = photodiodes;

%% Attach sensors to simParams and clear things
simParams.sensors = sensors;

end
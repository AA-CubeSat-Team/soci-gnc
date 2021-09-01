function [fswParams,simParams] = sensorProcessing_init(fswParams,simParams)
%sensorProcessing_init
%
% Initialization of the sensor processing library parameters. 
%
% Nick Melville

sensors = struct;

%% Sunsensor Processing
sensors.sunseek_hysteresis_deg = 10;
sensors.sun_sensor_range_deg = simParams.sensors.sun_sensor.range_deg - 12;

%% Magnetometer Processing
% Soft Iron Bias Calibration
SIB_cal_Matrix = [ 1, 0, 0;
                   0, 1, 0;
                   0, 0, 1 ];

% Hard Iron Bias Calibration
HIB_offset_Matrix = [ 0; 0; 0 ];

% Converts magnetometer sensor frame to satellite body frame. These 
% matrices are based on the most recent (as of March 2021) OB1 System 
% Architecture Layout. They are likely to change. 
Mag2Body_Matrix1 = [ 0, -1, 0;
                     1,  0, 0;
                     0,  0, 1 ];
Mag2Body_Matrix2 = [ sqrt(2)/2, -sqrt(2)/2, 0;
                     sqrt(2)/2,  sqrt(2)/2, 0;
                     0,          0,         1 ];
Mag2Body_Matrix3 = [ 1, 0, 0;
                     0, 1, 0;
                     0, 0, 1 ];       

% These matrices convert raw magnetometer data in the sensor frame into 
% usable data in the satellite body frame 
mag_rotate(:,:,1) = Mag2Body_Matrix1*SIB_cal_Matrix;
mag_rotate(:,:,2) = Mag2Body_Matrix2*SIB_cal_Matrix;
mag_rotate(:,:,3) = Mag2Body_Matrix3*SIB_cal_Matrix;
% ALL UNITS IN uT %
mag_offset(:,1) = Mag2Body_Matrix1*HIB_offset_Matrix;
mag_offset(:,2) = Mag2Body_Matrix2*HIB_offset_Matrix;
mag_offset(:,3) = Mag2Body_Matrix3*HIB_offset_Matrix;

% The magnetometer will have a certain amount of error. This will be
% determined during the sensor calibration. This value should be updated as 
% we get more detailed calibration values. For now its the max 6-sigma value.
expected_error_uT = 6 * max(sqrt(sum(simParams.sensors.mag.err_uT.^2,2))); % uT 
% calibration data
mag_error_FS = 4; %Factor of safety
mag_max_err_uT = expected_error_uT*mag_error_FS; %uT

mag_static_range_uT = 130; %uT. This value is the sensors static range. 
% This is greater than the Earth's max magnetic field of ~65uT.


sensors.mag_rotate       = mag_rotate;
sensors.mag_offset       = mag_offset;
sensors.mag_static_range = mag_static_range_uT;
sensors.mag_max_err      = mag_max_err_uT;

%% Gyroscope Processing
% Converts gyroscope sensor frame to satellite body frame. These 
% matrices are based on the most recent (as of March 2021) OB1 System 
% Architecture Layout. They are likely to change. 
gyro2Body_Matrix1 = [ 0, 1, 0;
                     -1, 0, 0;
                      0, 0, 1 ];
gyro2Body_Matrix2 = [ 0, 1, 0;
                     -1, 0, 0;
                      0, 0, 1 ];
gyro2Body_Matrix3 = [ 0, 1, 0;
                     -1, 0, 0;
                      0, 0, 1 ];                 

% These matrices convert raw gyroscope data in the sensor frame into usable 
% data in the satellite body frame 
gyro_rotate(:,:,1) = gyro2Body_Matrix1;
gyro_rotate(:,:,2) = gyro2Body_Matrix2;
gyro_rotate(:,:,3) = gyro2Body_Matrix3;

gyro_offset = [ 0, 0, 0; 
                0, 0, 0;
                0, 0, 0 ];

% The gyroscopes will have a certain amount of error. This will be
% determined during the sensor calibration. 
expected_error_radps = 0.005; % This value should be updated as we get more
% calibration data
gyro_error_FS = 4; %Factor of safety
gyro_max_err_radps = expected_error_radps*gyro_error_FS; %???

gyro_static_range_radps = 4.3633; %rad/s, or 250 deg/s, based on full scale 
% range from gyro data sheet. This is greater than the max expected rate. 

sensors.gyro_rotate         = gyro_rotate;
sensors.gyro_offset         = gyro_offset;
sensors.gyro_static_range   = gyro_static_range_radps;
sensors.gyro_max_err        = gyro_max_err_radps;

%% Magnetometer and magnetorquer duty cycling
% this will setup a duty cycle that covers <supercycle_length> FSW sample
% times. The MTQs will be active for the first <mtq_cycles_on_before>
% cycles of each supercycle. The magnetometers will be used only after this
% number of cycles *plus* an additional <mag_delay_cycles>. This lets any
% transients in the MTQ-induced magnetic field settle before we consume a
% new measurement. 
% For <supercycle_length>    = 10
%     <mtq_cycles_on_before> = 4
%     <mag_delay_cycles>     = 1
% the expected output looks like:
%
% MTQs "On"
%      ______      ______
%     |      |    |      |
%     |      |    |      | 
% ____|      |____|      |
%
% MAGs "On"
% ____         ___
%     |       |   |       |
%     |       |   |       |
%     |_______|   |_______|
%
% Note: The magnetometer readings are latched when this duty cycle reads
% "off", we *do not* mark the measurements as invalid.
sensors.duty_cycle.supercycle_length    = 10;
sensors.duty_cycle.mtq_cycles_on_before = 4;
mag_delay_cycles     = 1;
sensors.duty_cycle.mag_cycles_on_after  = ...
                    sensors.duty_cycle.mtq_cycles_on_before + mag_delay_cycles;

%% Defines the time offset parameter
% This will initially be 0, but will be updated to accountfor  drift in the
% onboard clock. This value is added to the clock's time. This ensures that
% environment estimation is accurate. 
sensors.time_offset = 0; % seconds

%% Add sensors struct to the main structs
fswParams.sensors = sensors;
end





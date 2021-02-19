function [fswParams,simParams] = gyrolib_init(fswParams,simParams)
%GYROLIB_INIT
%
% Initialization of the gyroscope processing library parameters.
%
% Nick Melville

% Converts gyroscope sensor frame to satellite body frame
gyro2Body_Matrix=[1,0,0;0,1,0;0,0,1];

% These matrices convert raw gyroscope data in the sensor frame into usable data in the satellite body frame 
gyro_rotate = gyro2Body_Matrix;
gyro_offset = [0,0,0;0,0,0;0,0,0];

% The gyroscopes will have a certain amount of error. This will be
% determined during the sensor calibration. 
expected_error = 0.1; %???
error_FS = 2; %Factor of safety
gyro_max_err = expected_error*error_FS; %???

gyro_static_range = 0.1; % rad/s

sensors.gyro_rotate = gyro_rotate;
sensors.gyro_offset = gyro_offset;
sensors.gyro_static_range = gyro_static_range;
sensors.gyro_max_err = gyro_max_err;
fswParams.sensors = sensors; 

end
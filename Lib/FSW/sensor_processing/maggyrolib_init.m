function [fswParams,simParams] = maggyrolib_init(fswParams,simParams)
%MAGGYROLIB_INIT
%
% Initialization of the magnetometer processing library parameters.
%
% Nick Melville

sensors = struct;

%% Magnetometer Processing
% Soft Iron Bias Calibration
SIB_cal_Matrix = [ 1, 0, 0;
                   0, 1, 0;
                   0, 0, 1 ];

% Hard Iron Bias Calibration
HIB_offset_Matrix = [ 0; 0; 0 ];

% Converts magnetometer sensor frame to satellite body frame
Mag2Body_Matrix1 = [ 0, -1, 0;
                     1,  0, 0;
                     0,  0, 1 ];
Mag2Body_Matrix2 = [ sqrt(2)/2, -sqrt(2)/2, 0;
                     sqrt(2)/2,  sqrt(2)/2, 0;
                     0,          0,         1 ];
Mag2Body_Matrix3 = [ 1, 0, 0;
                     0, 1, 0;
                     0, 0, 1 ];

% These matrices convert raw magnetometer data in the sensor frame into usable 
% data in the satellite body frame 
mag_rotate(:,:,1) = Mag2Body_Matrix1*SIB_cal_Matrix;
mag_rotate(:,:,2) = Mag2Body_Matrix2*SIB_cal_Matrix;
mag_rotate(:,:,3) = Mag2Body_Matrix3*SIB_cal_Matrix;

mag_rotate_test(:,:,1) = eye(3);
mag_rotate_test(:,:,2) = eye(3);
mag_rotate_test(:,:,3) = eye(3);

mag_offset1 = Mag2Body_Matrix1*HIB_offset_Matrix;
mag_offset2 = Mag2Body_Matrix2*HIB_offset_Matrix;
mag_offset3 = Mag2Body_Matrix3*HIB_offset_Matrix;

mag_offset = [ mag_offset1, mag_offset2, mag_offset3 ];

mag_offset_test = zeros(3,3);

% The magnetometer will have a certain amount of error. This will be
% determined during the sensor calibration. 
expected_error_uT = 5e-6; %uT
error_FS          = 4; %Factor of safety
mag_max_err_uT    = expected_error_uT*error_FS; %uT

mag_static_range_uT = 75e-6; %uT (Earth's magnetic field <= 65 uT)

sensors.mag_rotate       = mag_rotate;
sensors.mag_rotate_test  = mag_rotate_test;
sensors.mag_offset       = mag_offset;
sensors.mag_offset_test  = mag_offset_test;
sensors.mag_static_range = mag_static_range_uT;
sensors.mag_max_err      = mag_max_err_uT;

%% Gyroscope Processing
% Converts gyroscope sensor frame to satellite body frame
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

gyro_rotate_test(:,:,1) = eye(3);
gyro_rotate_test(:,:,2) = eye(3);
gyro_rotate_test(:,:,3) = eye(3);

gyro_offset = [ 0, 0, 0; 
                0, 0, 0;
                0, 0, 0 ];

gyro_offset_test = zeros(3,3);

% The gyroscopes will have a certain amount of error. This will be
% determined during the sensor calibration. 
expected_error_radps = 0.005;   % ???
error_FS             = 2;       % Factor of safety
gyro_max_err_radps   = expected_error_radps*error_FS; % ???

gyro_static_range_radps = 0.1; % rad/s

sensors.gyro_rotate         = gyro_rotate;
sensors.gyro_rotate_test    = gyro_rotate_test;
sensors.gyro_offset         = gyro_offset;
sensors.gyro_offset_test    = gyro_offset_test;
sensors.gyro_static_range   = gyro_static_range_radps;
sensors.gyro_max_err        = gyro_max_err_radps;

%% Add sensors struct to the main structs
fswParams.sensors = sensors; 

end


function [fswParams,simParams] = maggyrolib_init(fswParams,simParams)
%MAGLIB_INIT
%
% Initialization of the magnetometer processing library parameters.
%
% Nick Melville

sensors = struct;

% Soft Iron Bias Calibration
SIB_cal_Matrix=[1,0,0;0,1,0;0,0,1];

% Hard Iron Bias Calibration
HIB_offset_Matrix=[0;0;0];

% Converts magnetometer sensor frame to satellite body frame
Mag2Body_Matrix1=[0,-1,0;1,0,0;0,0,1];
Mag2Body_Matrix2=[sqrt(2)/2,-sqrt(2)/2,0;sqrt(2)/2,sqrt(2)/2,0;0,0,1];
Mag2Body_Matrix3=[1,0,0;0,1,0;0,0,1];

%Mag2Body_Matrix1=[1,0,0;0,1,0;0,0,1];
%Mag2Body_Matrix2=[1,0,0;0,1,0;0,0,1];
%Mag2Body_Matrix3=[1,0,0;0,1,0;0,0,1];

% These matrices convert raw magnetometer data in the sensor frame into usable data in the satellite body frame 
mag_rotate1 = Mag2Body_Matrix1*SIB_cal_Matrix;
mag_rotate2 = Mag2Body_Matrix2*SIB_cal_Matrix;
mag_rotate3 = Mag2Body_Matrix3*SIB_cal_Matrix;

mag_rotate(:,:,1) = mag_rotate1;
mag_rotate(:,:,2) = mag_rotate2;
mag_rotate(:,:,3) = mag_rotate3;

mag_rotate_test(:,:,1) = [1,0,0;0,1,0;0,0,1];
mag_rotate_test(:,:,2) = [1,0,0;0,1,0;0,0,1];
mag_rotate_test(:,:,3) = [1,0,0;0,1,0;0,0,1];

mag_offset1 = Mag2Body_Matrix1*HIB_offset_Matrix;
mag_offset2 = Mag2Body_Matrix2*HIB_offset_Matrix;
mag_offset3 = Mag2Body_Matrix3*HIB_offset_Matrix;

mag_offset = [mag_offset1, mag_offset2, mag_offset3];

mag_offset_test = [0,0,0;0,0,0;0,0,0;]

% The magnetometer will have a certain amount of error. This will be
% determined during the sensor calibration. 
expected_error = 5E-6; %uT
error_FS = 4; %Factor of safety
mag_max_err = expected_error*error_FS; %uT

mag_static_range = 75E-6; %uT (Earth's magnetic field <= 65 uT)

sensors.mag_rotate = mag_rotate;
sensors.mag_rotate_test = mag_rotate_test;
sensors.mag_offset = mag_offset;
sensors.mag_offset_test = mag_offset_test;
sensors.mag_static_range = mag_static_range;
sensors.mag_max_err = mag_max_err;


%GYROLIB_INIT
%
% Initialization of the gyroscope processing library parameters.
%
% Nick Melville

% Converts gyroscope sensor frame to satellite body frame
gyro2Body_Matrix1=[0,1,0;-1,0,0;0,0,1];
gyro2Body_Matrix2=[0,1,0;-1,0,0;0,0,1];
gyro2Body_Matrix3=[0,1,0;-1,0,0;0,0,1];

%gyro2Body_Matrix1=[1,0,0;0,1,0;0,0,1];
%gyro2Body_Matrix2=[1,0,0;0,1,0;0,0,1];
%gyro2Body_Matrix3=[1,0,0;0,1,0;0,0,1];

% These matrices convert raw gyroscope data in the sensor frame into usable data in the satellite body frame 
gyro_rotate1 = gyro2Body_Matrix1;
gyro_rotate2 = gyro2Body_Matrix2;
gyro_rotate3 = gyro2Body_Matrix3;

gyro_rotate(:,:,1) = gyro_rotate1;
gyro_rotate(:,:,2) = gyro_rotate2;
gyro_rotate(:,:,3) = gyro_rotate3;

gyro_rotate_test(:,:,1) = [1,0,0;0,1,0;0,0,1];
gyro_rotate_test(:,:,2) = [1,0,0;0,1,0;0,0,1];
gyro_rotate_test(:,:,3) = [1,0,0;0,1,0;0,0,1];

gyro_offset = [0,0,0;0,0,0;0,0,0];

gyro_offset_test = [0,0,0;0,0,0;0,0,0];

% The gyroscopes will have a certain amount of error. This will be
% determined during the sensor calibration. 
expected_error = 0.005; %???
error_FS = 2; %Factor of safety
gyro_max_err = expected_error*error_FS; %???

gyro_static_range = 0.1; % rad/s

sensors.gyro_rotate = gyro_rotate;
sensors.gyro_rotate_test = gyro_rotate_test;
sensors.gyro_offset = gyro_offset;
sensors.gyro_offset_test = gyro_offset_test;
sensors.gyro_static_range = gyro_static_range;
sensors.gyro_max_err = gyro_max_err;
fswParams.sensors = sensors; 

end


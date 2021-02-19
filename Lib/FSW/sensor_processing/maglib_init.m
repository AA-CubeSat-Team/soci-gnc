function [fswParams,simParams] = maglib_init(fswParams,simParams)
%MAGLIB_INIT
%
% Initialization of the magnetometer processing library parameters.
%
% Nick Melville

sensors = struct;

SIB_cal_Matrix=[1,0,0;0,1,0;0,0,1];

HIB_offset_Matrix=[0,0,0;0,0,0;0,0,0];

Mag2Body_Matrix=[1,0,0;0,1,0;0,0,1];

% These matrices convert raw magnetometer data in the sensor frame into usable data in the satellite body frame 
mag_rotate = Mag2Body_Matrix*SIB_cal_Matrix;
mag_offset = Mag2Body_Matrix*HIB_offset_Matrix;

mag_max_err = 0.1;

mag_static_range_uT = 75; % Micro Teslas

sensors.mag_rotate = mag_rotate;
sensors.mag_offset = mag_offset;
sensors.mag_static_range_uT = mag_static_range_uT;
sensors.mag_max_err = mag_max_err;
fswParams.sensors = sensors; 

end


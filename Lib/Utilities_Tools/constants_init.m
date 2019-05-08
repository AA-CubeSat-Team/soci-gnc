
constants = struct;



% All conversion gains
constants.convert = struct;
% convert meters to kilometers
constants.convert.M2KM = 1.0e-3;
% convert kilometers to meters
constants.convert.KM2M = 1.0e3;
% convert degrees to radians
constants.convert.DEG2RAD = pi / 180;
% convert radians to degrees
constants.convert.RAD2DEG = 180 / pi;
% convert days to seconds
constants.convert.DAY2SEC = 86400;
% convert seconds to days
constants.convert.SEC2DAY = 1 / 86400;
% convert rotations per second to rotations per minute
constants.convert.RPS2RPM = 60/(2*pi);
% convert the other way dummy 
constants.convert.RPM2RPS = 2*pi/60;


% Global Constants
constants.global = struct;
constants.global.w_earth_rads = [0;0;0.0000729211585530]; 
constants.global.mu_earth_km3s2 =  398600.4418;
constants.global.r_earth_km = 6378.137;


fswParams.constants = constants;
clear constants
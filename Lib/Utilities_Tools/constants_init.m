
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
constants.convert.SEC2DAY = 1.0 / 86400;
% convert rotations per second to rotations per minute
constants.convert.RPS2RPM = 60/(2*pi);
% convert the other way dummy 
constants.convert.RPM2RPS = 2*pi/60;
% convert AU to kilometers
constants.convert.AU2KM = 149598073;
% convert nT to T
constants.convert.nT2T  = 1e-9;
% convert s to h
constants.convert.HR2SEC = 3600.0;
% convert h to s
constants.convert.SEC2HR = 1/3600.0;
% convert s to m
constants.convert.MIN2SEC = 60.0;
% convert h to s
constants.convert.SEC2MIN = 1/60.0;

% Global Constants
constants.global = struct;
constants.global.w_earth_rads = [0;0;0.0000729211585530]; 
constants.global.mu_earth_km3s2 =  398600.4418;
constants.global.r_earth_km = 6378.137;

constants.global.JDJ2000 = 2451545.0;

% 3.5 degrees attitude error is switch between tracking and 
% reorientation controllers. If tripped, reorientation controller
% will activate until it is brought below 1.5 degrees.
constants.global.reorientation_controller_threshold_max = 3.5;
constants.global.reorientation_controller_threshold_min = 1.5;

% Use to protect against division by zero
constants.global.small = 1e-4;

% state vector definitions
constants.id_r = (1:3);
constants.id_v = constants.id_r(end) + (1:3);
constants.id_q = constants.id_v(end) + (1:4);
constants.id_w = constants.id_q(end) + (1:3);

fswParams.constants = constants;
simParams.constants = constants;
clear constants
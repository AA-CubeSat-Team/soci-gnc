function [fswParams,simParams] = constants_init(fswParams,simParams)

constants = struct;

% All conversion gains
convert = struct;
convert.M2KM = 1.0e-3;          % convert meters to kilometers
convert.KM2M = 1.0e3;           % convert kilometers to meters
convert.DEG2RAD = pi / 180;     % convert degrees to radians
convert.RAD2DEG = 180 / pi;     % convert radians to degrees
convert.DAY2SEC = 86400;        % convert days to seconds
convert.SEC2DAY = 1.0 / 86400;  % convert seconds to days
convert.RPS2RPM = 60/(2*pi);    % convert rotations per second to rotations per minute
convert.RPM2RPS = 2*pi/60;      % convert the other way dummy 
convert.AU2KM = 149598073;      % convert AU to kilometers 
convert.nT2T  = 1e-9;           % convert nT to T
convert.HR2SEC = 3600.0;        % convert s to h
convert.SEC2HR = 1/3600.0;      % convert h to s
convert.MIN2SEC = 60.0;         % convert s to m
convert.SEC2MIN = 1/60.0;       % convert h to s
% add to constants struct
constants.convert = convert;

% Global Constants
gbl = struct;
gbl.small = 1e-8;
gbl.w_earth_rads = [0;0;0.0000729211585530]; 
gbl.mu_earth_km3s2 = 398600.4418;
gbl.r_earth_km = 6378.137;
gbl.JDJ2000 = 2451545.0;
% 3.5 degrees attitude error is switch between tracking and 
% reorientation controllers. If tripped, reorientation controller
% will activate until it is brought below 1.5 degrees.
gbl.reorientation_controller_threshold_max = 3.5;
gbl.reorientation_controller_threshold_min = 1.5;
% add to constants struct
constants.global = gbl;

% add constants struct to both main structs
fswParams.constants = constants;
simParams.constants = constants;

end
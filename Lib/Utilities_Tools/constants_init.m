function [fswParams,simParams] = constants_init(fswParams,simParams)
%CONSTANTS_INIT
%
% Defines the constant values used throughout both the sim and fsw. 
%
% T. P. Reynolds

constants = struct;

% Conversion multiplicative factors
convert = struct;
convert.M2KM    = 1.0e-3;          % convert meters to kilometers
convert.KM2M    = 1.0e3;           % convert kilometers to meters
convert.DEG2RAD = pi / 180;         % convert degrees to radians
convert.RAD2DEG = 180 / pi;         % convert radians to degrees
convert.DAY2SEC = 86400;            % convert days to seconds
convert.SEC2DAY = 1.0 / 86400;      % convert seconds to days
convert.RPS2RPM = 60/(2*pi);        % convert rotations/second to rpm
convert.RPM2RPS = 2*pi/60;          % convert the other way dummy 
convert.AU2KM   = 149598073;        % convert AU to kilometers 
convert.nT2T    = 1e-9;             % convert nanoTesla to Tesla
convert.T2uT    = 1e6;              % convert Tesla to microTesla
convert.uT2T    = 1e-6;             % convert microTesla to Tesla
convert.HR2SEC  = 3600.0;           % convert sec to hour
convert.SEC2HR  = 1/3600.0;         % convert hour to sec
convert.MIN2SEC = 60.0;             % convert sec to min
convert.SEC2MIN = 1/60.0;           % convert min to sec
% add to constants struct
constants.convert = convert;

% Global Constants
gbl = struct;
gbl.small           = 1e-8;                         % a small number
gbl.w_earth_rads    = [ 0; 0; 0.0000729211585530 ]; % rotation vector in ECI
gbl.mu_earth_km3s2  = 398600.4418;                  % gravitational parameter
gbl.r_earth_km      = 6378.137;                     % radius (spherical approx)
gbl.JDJ2000         = 2451545.0;                    % J2000 epoch in Julian Days
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
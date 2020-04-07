% Initializes various FSW parameters that don't have
% a dedicated init file.
%
%
% Author: Cole Morgan


mode_select       = struct;
target_generation = struct;

mode_select.sc_mode_ic              = int8(1.0);
mode_select.body_rate_threshold_max = 9*pi/180;  %rad/s
mode_select.body_rate_threshold_min = .5*pi/180; %rad/s
mode_select.RWA_RPM_threshold_max   = 4500; %RPM
mode_select.RWA_RPM_threshold_min   = 1100; %RPM

% Define our orbit
% YMDHMS  = [ 2020; 1; 1; 0; 0; 0 ];
% INC     = 54.6146;  % inclination
% RAAN    = 247.4627; % right ascension of ascending node
% ECC     = 0006703; % keep this w/o decimals and 7 digits
% AOP     = 130.5360; % arg of perigee
% MNA     = 325.0288; % mean anomaly
% MNM     = 15.72125391; % mean motion
% 
% % Generate TLE (saved as text file in /adcs_sim/matlab/include/TLEs/
% tle = TLE_gen(YMDHMS, INC, RAAN, ECC, AOP, MNA, MNM);

[orbit_tle,~]               = get_tle(TLE);
 

fswParams.mode_select       = mode_select;
fswParams.target_generation = target_generation;
% fswParams.tle               = tle;
fswParams.tle               = orbit_tle;

clear orbit_tle
clear mode_select
clear target_generation  
clear YMDHMS INC RAAN ECC AOP MNA MNM tle
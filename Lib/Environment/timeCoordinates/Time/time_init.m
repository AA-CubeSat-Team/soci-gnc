function [fswParams,simParams] = time_init(fswParams,simParams)
%TIME_INIT
%
% Define the initial time information used by the sim
%
% T. P. Reynolds

time = struct;

% EPOCH YEAR (assuming it is AFTER the year 2000)
time.y_epoch = 2000 + simParams.orbit_tle(1);

% OFFSETS FOR TIME FRAME CHANGE
time.DUT1 = -0.0361535; % UTC -> UT1 offset (this is date specific)
time.TAI_offset = 37;   % UTC -> TAI offset
time.DTT_TAI = 32.184;  % TAI -> TT offset

% Mission start time (orbit_tle(2) is epoch in JD_UTC_J2000)
time.epoch_utc_s = ...
              simParams.orbit_tle(2) * fswParams.constants.convert.DAY2SEC;

% add to main structs
simParams.time = time;

end
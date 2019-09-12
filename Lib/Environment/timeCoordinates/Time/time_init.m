time = struct;

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% REFERENCE EPOCH YEAR
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
time.y_epoch = 2000 + simParams.orbit_tle(1);

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% OFFSETS FOR TIME FRAME CHANGLE
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
time.DUT1 = -0.0361535; %UTC -> UT1 Offset
time.TAI_offset = 37; %UTC -> TAI offset
time.DTT_TAI = 32.184; %TAI -> TT offset

% Mission start time (orbit_tle(2) is epoch in JD_UTC_J2000)
time.epoch_utc_s = ...
              simParams.orbit_tle(2) * fswParams.constants.convert.DAY2SEC;

% Clock resolution
time.res = 1e-6;

simParams.time = time;
clear time
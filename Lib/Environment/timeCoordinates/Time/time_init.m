

time = struct;



% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% REFERENCE EPOCH
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
time.y_epoch = 2000;

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% OFFSETS FOR TIME FRAME CHANGLE
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
time.DUT1 = -0.0361535; %UTC -> UT1 Offset
time.TAI_offset = 37; %UTC -> TAI offset
time.DTT_TAI = 32.184; %TAI -> TT offset


% Mission start time (Jan 1 2019 0:0:0 -> dec 31 2018 11:59:59)
time.epoch_utc_s = 599572800.000000;

% Time resolution
time.res = 1;

simParams.time = time;
clear time
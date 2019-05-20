

time = struct;



% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% REFERENCE EPOCH
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
time.y_epoch = 2000;

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% OFFSETS FOR TIME FRAME CHANGLE
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
time.DUT1 = -0.017795; %UTC -> UT1 Offset
time.TAI_offset = 37; %UTC -> TAI offset
time.DTT_TAI = 32.184; %TAI -> TT offset


%  Mission start time (arbitrarily mar 12 2015 3:14PM)
time.epoch_utc_s = 478616400.000000;

% Time resolution
time.res = 1;

simParams.time = time;
clear time
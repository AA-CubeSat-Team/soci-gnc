

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

simParams.time = time;
clear time
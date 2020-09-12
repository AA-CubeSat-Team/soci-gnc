function [YMDHMS_UTC,YMDHMS_UT1,JD_UTC,JD_UT1,JC_UTC_J2000,JC_UT1_J2000,JC_TT_J2000] = matlab_time_lib(MET_UTC_J2000,time_struct)
%MATLAB_TIME_LIB 
% 
% Time conversions for SOC-i GNC software. Input is assumed to be the
% Mission Elapsed Time in seconds since the J2000 epoch in the UTC frame. 
%
% Devan Tormey & Taylor Reynolds

% OFFSETS FOR TIME FRAME CHANGE
DUT1        = time_struct.DUT1;          % UTC -> UT1 offset
TAI_offset  = time_struct.TAI_offset;    % UTC -> TAI offset
DTT_TAI     = time_struct.DTT_TAI;       % TAI -> TT offset

% CONVERT INPUT UTC TO TAI, TT, and UT1
MET_TAI_J2000 = MET_UTC_J2000 + TAI_offset;
MET_TT_J2000  = MET_TAI_J2000 + DTT_TAI;
MET_UT1_J2000 = MET_UTC_J2000 + DUT1;

% convert the UTC time
[y,m,d,h,min,s,JC_UTC_J2000,JD_UTC] = jseconds2ymdhms(MET_UTC_J2000);
YMDHMS_UTC  = [ y; m; d; h; min; s ];

% convert the UT1 time
[y,m,d,h,min,s,JC_UT1_J2000,JD_UT1] = jseconds2ymdhms(MET_UT1_J2000);
YMDHMS_UT1  = [ y; m; d; h; min; s ];

% convert the TT time
[~,~,~,~,~,~,JC_TT_J2000,~] = jseconds2ymdhms(MET_TT_J2000);

end
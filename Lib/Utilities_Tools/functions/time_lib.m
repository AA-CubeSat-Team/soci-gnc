% AUTHOR: Devan
% DATE: 6/4/19
function [UTC_ymd,UTI_ymd,TT_ymd,TAI_ymd,JD_UTC,JD_UTI,JD_TT,JD_TAI,JC_UTC,JC_UTI,JC_TT,JC_TAI,Time] = time_lib(utc_in,simParams)
%TIMCONVERSION Summary of this function goes here
%   Detailed explanation goes here

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%the outputs will be formatted as such:
%JD = [JDutc JDut1 JDtt JDtai]
%JC = [JCutc JCut1 JCtt JCtai]
%YMDHS = [YMDHSutc YMDHSut1 YMDHStt YMDHStai] 
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% OFFSETS FOR TIME FRAME CHANGLE
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DUT1 = simParams.time.DUT1; %UTC -> UT1 Offset
TAI_offset = simParams.time.TAI_offset; %UTC -> TAI offset
DTT_TAI = simParams.time.DTT_TAI; %TAI -> TT offset

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%CONVERT ALL SECONDS
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
TAI = utc_in + TAI_offset;
TT = TAI + DTT_TAI;
UT1 = utc_in + DUT1;

Time = [utc_in,UT1,TT,TAI];%Time in seconds

% Format inputs for loop
j_seconds_in = [utc_in, UT1, TT, TAI];

% Allocate Memory for outputs
YMDHMSutc = zeros(6,1);
YMDHMSut1 = zeros(6,1);
YMDHMStt = zeros(6,1);
YMDHMStai = zeros(6,1);
YMDHMS = {YMDHMSutc,YMDHMSut1,YMDHMStt,YMDHMStai};
JD = zeros(4,1);
JC = zeros(4,1);

% Loop through Each time
    for i = 1:4
%       Convert time
        [y,m,d,h,min,s,jc,jd] = jseconds2ymdhms(Time(i));      
%       Asign Outputs
        YMDHMS{i} = [y m d h min s];
        JD(i) = jd;
        JC(i) = jc; 
    end
 
UTC_ymd = zeros(1,6);
UTI_ymd = zeros(1,6);
TT_ymd  = zeros(1,6);
TAI_ymd = zeros(1,6);
for k = 1:6
    UTC_ymd(k) = YMDHMS{1}(k);
    UTI_ymd(k) = YMDHMS{2}(k);
    TT_ymd(k)  = YMDHMS{3}(k);
    TAI_ymd(k) = YMDHMS{4}(k);
end
JD_UTC = JD(1);
JD_UTI = JD(2);
JD_TT = JD(3);
JD_TAI = JD(4);

JC_UTC = JC(1);
JC_UTI = JC(2);
JC_TT = JC(3);
JC_TAI = JC(4);

end

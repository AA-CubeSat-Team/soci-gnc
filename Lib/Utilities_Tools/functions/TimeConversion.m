% AUTHOR: Devan
% DATE: 12/26/18
function [UTC_ymd,UTI_ymd,TT_ymd,TAI_ymd,JD_UTC,JD_UTI,JD_TT,JD_TAI,JC_UTC,JC_UTI,JC_TT,JC_TAI,Time] = TimeConversion(utc_in,simParams)
%TIMCONVERSION Summary of this function goes here
%   Detailed explanation goes here

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%the outputs will be formatted as such:
%JD = [JDutc JDut1 JDtt JDtai]
%JC = [JCutc JCut1 JCtt JCtai]
%YMDHS = [YMDHSutc YMDHSut1 YMDHStt YMDHStai] 
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% REFERENCE EPOCH
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
y_epoch = simParams.time.y_epoch;

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


INPUTs = [utc_in, UT1, TT, TAI];
YMDHMSutc = zeros(6,1);
YMDHMSut1 = zeros(6,1);
YMDHMStt = zeros(6,1);
YMDHMStai = zeros(6,1);
YMDHMS = {YMDHMSutc,YMDHMSut1,YMDHMStt,YMDHMStai};
JD = zeros(4,1);
JC = zeros(4,1);
    for i = 1:4
        serialDays = Seconds_to_Days(INPUTs(i));

        % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        %     CALCULATE YMD
        % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       
        YMD = daysToYMD(serialDays);
        
        y = YMD(1);
        m = YMD(2);
        d = YMD(3);

        % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        %     CALCULATE HMS
        % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        %remaining seconds after ymd subtractions
        remaining_seconds = INPUTs(i) - serialDays*86400;
        
        %actuall hms conversion
        h = floor(remaining_seconds/(60*60));
        remaining_seconds = remaining_seconds - (h*60*60);
        min = floor(remaining_seconds/60);
%         left = remaining_seconds/60 - floor(remaining_seconds/60);
        remaining_seconds = remaining_seconds - (min*60);
        s = remaining_seconds %+ left;
        
        %actuall hms conversion
        
        
        % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        %     FORMAT OUTPUT
        % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        
        %Wrap answer into YMDHMS Cell 
        YMDHMS{i} = [y m d h min s];

        %Calculate JD for each
        JD(i) = julianDate(YMDHMS{i});

        % ~~~~~~~~~~~~~~~~~~~~~~~~~~~
        %TO DO //////////////////////
        % ~~~~~~~~~~~~~~~~~~~~~~~~~~
        JC(i) = (JD(i)-2451545.0)/36525; %julian date to julian century, equ 3-42 Vallado


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

% AUTHOR: Devan
% DATE: 12/26/18
function [YMDHMS,JD,JC] = TimeConversion(utc_in)
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
y_epoch = 2000;

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% OFFSETS FOR TIME FRAME CHANGLE
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DUT1 = -0.017795; %UTC -> UT1 Offset
TAI_offset = 37; %UTC -> TAI offset
DTT_TAI = 32.184; %TAI -> TT offset


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%CONVERT ALL SECONDS
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
TAI = utc_in + TAI_offset;
TT = TAI + DTT_TAI;
UT1 = utc_in + DUT1;

INPUTs = [utc_in, UT1, TT, TAI];
YMDHMSutc = zeros(6,1);
YMDHMSut1 = zeros(6,1);
YMDHMStt = zeros(6,1);
YMDHMStai = zeros(6,1);
YMDHMS = {YMDHMSutc,YMDHMSut1,YMDHMStt,YMDHMStai};

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
        left = remaining_seconds/60 - floor(remaining_seconds/60);
        remaining_seconds = remaining_seconds - (min*60);
        s = remaining_seconds + left;
        
        
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






end


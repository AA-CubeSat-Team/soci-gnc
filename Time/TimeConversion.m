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
YMDHMSutc = [];
YMDHMSut1 = [] ;
YMDHMStt = [];
YMDHMStai = [];
YMDHMS = {YMDHMSutc,YMDHMSut1,YMDHMStt,YMDHMStai};

    for i = 1:4
        serialDays = Seconds_to_Days(INPUTs(i));


        % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        %     CALCULATE YMD
        % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        % ~~~~~~~~~~~~~~~~~~~~~~~~~~~
        %TO DO //////////////////////
        % ~~~~~~~~~~~~~~~~~~~~~~~~~~
        %TURN THIS INTO A FUNCTION THAT PROPOGATE THROUGH YEARS
        %TO ACCURATELY FIND Y
        
        y = floor(serialDays/365);
        
        %Calculate Leap Days
        [numberLeap,leapYears] = howManyLeap(y_epoch,y);

        %Find the days remaining after years
        daysFromYears = years_to_days(y,y_epoch);
        %Current Days in the current year
        d_y = daysFromYears-serialDays;

        %Grab the Month and current Days from day of year  
        [m,d] = daystoMonth(d_y,y,y_epoch);
        %bump up the year by epoch
        y = y_epoch + y;

        % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        %     CALCULATE HMS
        % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        %remaining seconds after ymd subtractions
        remaining_seconds = daysFromYears*86400 - INPUTs(i) - d*86400/2;
        %actuall hms conversion
        min = remaining_seconds/60;
        h = min/60;
        s = remaining_seconds - h*60*60 - min*60;
        
        
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
        JC(i) = 0;


    end






end


function [Year, Month, Day, h, min, s,JC,JD] = jseconds2ymdhms(j_seconds)
%JSECONDS2YMDHMS This function takes in an arbitrary time stamp in seconds
%and converts to YMDHMS, Julian Century and Julian Date

% Constants
DAY2SEC = 86400; %convert seconds to days
JD_J2000 = 2451545; %move back to absolute JD team
LMonth = [31,28,31,30,31,30,31,31,30,31,30,31]; %Days in each month (non Leapyr)


% Allocate Space for Outputs
YMDHMS = zeros(6,1);
JC = 0;
JD = 0;
Month = 0;
temp = 0;

% ~~~~~~~~~~~~~~~~~~~~~~
% Convert to Julian Days
% ~~~~~~~~~~~~~~~~~~~~~~
JD = j_seconds/DAY2SEC + JD_J2000; %Julian Day absolute


% ~~~~~~~~~~~~~~~~~~~~~~~~~~
% Convert to Julian Century
% ~~~~~~~~~~~~~~~~~~~~~~~~~~
JC=(JD-2451545.0)/36525; %julian cenutry from pg 184 of Vallado, 
%constant for all time frames

%NOTE julian century is off by 11 minutes and 14 seconds per year or one
%day every 128 years. Since cubesat will not be operating til 2128, do not
%need to account for error in julian century

% ~~~~~~~~~~~~~~~~~~~~~~~~~
% Convert from JD to YMDHMS
% ~~~~~~~~~~~~~~~~~~~~~~~~~
% This is take from vallado pg 202 (4th edition) ALGORITHM 22
% tested against the example on pg 203 
T_1900 = (JD - 2415019.5)/365.25;

Year = 1900 + floor(T_1900);

LeapYrs = floor( (Year - 1900 - 1)*(0.25)  );
Days = (JD - 2415019.5)  - ( (Year - 1900)*(365.0) + LeapYrs );

if Days<1 
    Year = Year - 1;
    LeapYrs = floor( (Year - 1900 - 1)*(0.25)  );
    Days = (JD - 2415019.5)  - ( (Year - 1900)*(365.0) + LeapYrs );    
end

% current year leap?
if mod(Year,4) == 0
    LMonth(2) = 29; %change god damn fucking february
end

DayofYr = floor(Days);
% Calculate the day
sum = 0;


while sum < DayofYr
    Month   = Month + 1;
    sum = sum + LMonth(Month);
end

Day = DayofYr - (sum - LMonth(Month));

% Day = DayofYr;

% ~~~~~~~~~~~~~~~~~~~~~~~~~~
% Determine Hour Min Second
% ~~~~~~~~~~~~~~~~~~~~~~~~~~

tau = (Days - DayofYr)*24;
h = floor(tau);
min =floor((tau - h)*60);
s = (tau - h - min/60)*3600;







end


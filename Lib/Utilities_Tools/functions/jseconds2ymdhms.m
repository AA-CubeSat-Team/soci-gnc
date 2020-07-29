function [Year,Month,Day,Hour,Min,Sec,JC_J2000,JD] = jseconds2ymdhms(time_s_J2000)
%JSECONDS2YMDHMS
%
% This function takes in an arbitrary time stamp in seconds
% since the J2000 epoch and converts to YMDHMS, Julian Century and 
% absolute Julian Date.
%
% Uses the following algorithms from Vallado 4e:
%   - ALGORITHM 22 on p. 202 (tested again Ex 3-13 on p. 203)
%   - Eq (3-42) on p. 184 for Julian century calculation

% Constants
DAY2SEC  = 86400;       % convert seconds to days
JD_J2000 = 2451545;     % J2000 epoch in Julian days
JD_1900  = 2415019.5;   % J1900 epoch in Julian days
LMonth   = [31,28,31,30,31,30,31,31,30,31,30,31]; % days in each month

% compute absolute Julian Day 
JD = time_s_J2000/DAY2SEC + JD_J2000; 

% convert to julian cenutry since J2000 epoch
JC_J2000 = ( JD - JD_J2000 )/36525; 

% Convert from JD to YMDHMS using Algorithm 22
T_1900 = (JD - JD_1900)/365.25;

Year = 1900 + floor(T_1900);

LeapYrs = floor( (Year - 1900 - 1)*(0.25)  );
Days = (JD - JD_1900)  - ( (Year - 1900)*(365.0) + LeapYrs );

if Days<1 
    Year = Year - 1;
    LeapYrs = floor( (Year - 1900 - 1)*(0.25)  );
    Days = (JD - JD_1900)  - ( (Year - 1900)*(365.0) + LeapYrs );    
end

% current year leap?
if mod(Year,4) == 0
    LMonth(2) = 29; %change god damn fucking february
end

DayofYr = floor(Days);
% Calculate the day
sum = 0;
Month = 0;
while sum < DayofYr
    Month = Month + 1;
    sum = sum + LMonth(Month);
end
% Day = DayofYr - (sum - LMonth(Month));
% the Day output must be DayofYr for the atmospheric model
Day = DayofYr;

% determine the Hour-Min-Second
tau  = (Days - DayofYr)*24;
Hour = floor(tau);
Min  = floor((tau - Hour)*60);
Sec  = (tau - Hour - Min/60)*3600;

end


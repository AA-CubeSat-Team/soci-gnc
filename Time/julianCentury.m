function [JC]=julianCentury(JD, y)
%function converts julian date into julian year (aka century, noted at T_tt in textbook)
%input will be JD of three different time frames, output will be julian
%year in each of those time frames

%test
JD=22260.84097;
y=2018;

JC=(JD-2451545.0)/36525; %julian cenutry from pg 184 of Vallado, 
%constant for all time frames

%NOTE julian century is off by 11 minutes and 14 seconds per year or one
%day every 128 years. Since cubesat will not be operating til 2128, do not
%need to account for error in julian century

end %end of function

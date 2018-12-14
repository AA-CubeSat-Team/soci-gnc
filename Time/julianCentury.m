function [JC,JDoY]=julianCentury(JD, y)
%function converts julian date into julian year and day of the year
%input will be JD of three different time frames, output will be julian
%year and dy of year in each of those time frames

%test
JD=22260.84097;
y=2018;

JDoYN=(JD-2451540.0)/36525; %julian day of year from pg 184 of Vallado, 
%constant for all time frames, integral from 1 to 365 or 366 if leap
%will be a negtive value going backwards from day 365

%if current year a leap year, JDoYN+366, else JDoYN+365 = JDoY
if mod(y,4)==0
    JDoY=JDoYN+366%is a leap year
else
    JDoY=JDoYN+365%not a leap year
end
    
JC=JD/36525 %page 4 of Vallado since year 2000
%NOTE julian century is off by 11 minutes and 14 seconds per year or one
%day every 128 years. Since cubesat will not be operating til 2128, do not
%need to account for error in julian day of year

end %end of function
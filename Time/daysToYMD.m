% AUTHOR: ??
% DATE: ??

function [YMD] = daysToYMD(serial_days)
%Takes the input of serial_days from a specific timeframe and converts
%those days into years,months,days.

J2000=2000; %J2000 epoch

%Initial Parameters
y = 0;
current_year = J2000;

while serial_days > 0 
    %Following statement is checking whether a year is leap or not
    if rem(current_year,4) == 0 %if current year is a leap year...
        Year=[31 29 31 30 31 30 31 31 30 31 30 31]; %days in each month for the year from Jan-Dec
        serial_days = serial_days - sum(Year);
        y = y+1;%adding another year since J2000
        current_year = current_year + 1;%moving into another year 
    else %if current year is not a leap year...
        Year=[31 28 31 30 31 30 31 31 30 31 30 31];%days in each month for the year from Jan-Dec
        serial_days = serial_days - sum(Year);%Subtracting days in year from total amount of serial days
        y = y+1; %
        current_year = current_year + 1;   
    end
end

%The while loop overshoots the current year and years since J2000 by 1. In
%order to obtain the actual year, 1 must be sustracted. 

current_year = current_year-1;  %Actual year we are in.
y = y-1;% actual years since J2000


%Need to check whether the current_year is leap or not, so that we can add
%back the right amount days to serial days as our output from serial days
%was negative at the end of the while loop. This gives us the serial days 
%into the current year. 
if rem(current_year,4)==0
    serial_days = serial_days+366;
else
    serial_days = serial_days+365;
end

%This function will calculated the months and days into the current month. 
[m,d]=daystoMonth(serial_days,current_year,J2000); %checking-days-months
YMD = [y m d]; %years-months-days






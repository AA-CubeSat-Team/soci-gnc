%Testing The Algorithms for Time Conversion
%Author: Devan Tormey

clear; clc; close all;

%My idea for a flow would be
%given number in seconds -> calculate serial days
%The remainder should be the HMS (we haven't acounted for leap seconds but
%we will soon)
%Now that we have the serial days since epoch we can think of the next task
%as filling up bins. We have two bins, years and months, once those two are
%full we should be left with the current day of the month. The trick to
%this is that all months are not the same length and all years are not the
%same length. To do this I created a function is_Leap that should catch
%100% of all leap years.


%To test this Im going to say today is J2000. In UTC the timestamp in
%second for that day is,

utc_in = 599572800 %seconds
TAI_offset = 37;
DTT_TAI = 32.184;
DUT1 = -0.017795;

TAI = utc_in + TAI_offset
TT = TAI + DTT_TAI
UT1 = utc_in + DUT1

y_epoch = 2000; %This is J2000 Epoch
serialDays = Seconds_to_Days(utc_in);

%since the epoch is January 1, 2000 we should expect roughly 19 years out
%of this

y = floor(serialDays/365);

% hey look at that turns out y_ruff is fine. Let's find Leap years
[howManyLeap,leapYears] = howManyLeap(y_epoch,y);

%cool so I found Leap years and how many occured. Next is to remove all the
%seconds from years (accounting for leap years to find an acurate number of
%days that will translate to current months;

daysFromYears = years_to_days(y,y_epoch);

d_y = daysFromYears-serialDays;

[m,d] = daystoMonth(d_y,y,y_epoch);




y = y_epoch + y;

YMD = [y m d];

remaining_seconds = daysFromYears*86400 - utc_in - d*86400/2;

min = remaining_seconds/60;
h = min/60;
s = remaining_seconds - h*60*60 - min*60;

YMDHMS_utc = [y m d h min s]





%~~~~~~~ TO DO ~~~~~~~~~~~~`
% /////////////////////////
% s = s + TAI_offset;
% if s > 60
%     s = s - 60;
%     min = min + 1;
%     if min > 60
%         min = min - 60;
%         h = h + 1;
%         if h > 24
%             d = d + 1; 
%             h = h - 24;
%             %bump the date up shit 
%             %TO DO
%         end
%         
%     end
% end


JDutc = julianDate(YMDHMS_utc)









%Author- Ivan Machuca
%Date Revised - 12/28/18

clear all; close all; clc; 
UTC = 137803367; % Time in seconds since J2000. (Actual date of May 14,2004)
%UTC = 599572800; %Time in seconds since J2000 . (Actual date of 12/31/18 )

Days = UTC * (1/60)*(1/60)*(1/24);
[YMD] = daysToYMD(Days);
%This function gives 13.9464 days into the month. This means 13 full days
%have passed and .9464 days can be converted to an hour/minute. On a
%calendar, 13.9464 days puts the date on the 14th. So this function gives
%the right amount of days and hours/minutes into the current month. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Below is just a test to test whether the YMD could return the actual date
%5/14/04 10:42 pm from textbook example. 

Days_into_month = YMD(:,3);
Hours = abs(floor(Days_into_month)-Days_into_month) * 24;
Minutes = abs(floor(Hours)-Hours)*60;
s = abs(floor(Minutes)-Minutes)*60;

D=floor(Days_into_month);
H=floor(Hours);
Min=floor(Minutes);

[YMDHMins] = [YMD(:,1:2) D H Min s];


jd = juliandate([YMDHMins]); %calculated the julian date 

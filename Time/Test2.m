%Author- Ivan Machuca
%Date Revised - 1/10/18
%This tests the daysToMonths function


clear all; close all; clc; 
UTC = 137803367; %Time in seconds since J2000. (Actual date of May 14,2004 10:42)
%UTC2 = 599572800;%Time in seconds since J2000 .(Actual date of Jan 1,2019 00:00)

Days = UTC * (1/60)*(1/60)*(1/24); %Converting seconds into serial days. 
[YMD] = daysToYMD(Days); %inputs serial days and outputs those serial days into
%years months days. 

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

[YMDHMins] = [YMD(:,1:2) D H Min s]%[Years Months Days Hours Minutes Seconds]
%This timestamp reads as years since 2000, Month in the current year, calendar day
%in the current month, hours of the current day, minutes of the current
%hour, seconds of the current minute. 















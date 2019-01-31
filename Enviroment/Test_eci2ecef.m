%Author Ivan Machuca
%Date 1/23/18

clear all;close all; clc; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Example 3-15 in the textbook 
UTC = 366*24*3600 + 365*24*3600*3 + (31+29+31+4)*24*3600 + ...
    7*3600+51*60+28.386009;% Time in seconds since J2000 (Actual date 4/16/2004 7:51:28.386009) PM) UTC

TT = UTC + 32 + 32.184; %Time in seconds since J2000 in TT

Days = TT * (1/60)*(1/60)*(1/24); %Converting seconds into serial days. 

[YMD] = daysToYMD(Days); %inputs serial days and outputs those serial days into
Days_into_month = YMD(:,3);
Hours = abs(floor(Days_into_month)-Days_into_month) * 24;
Minutes = abs(floor(Hours)-Hours)*60;
s = abs(floor(Minutes)-Minutes)*60;
D=floor(Days_into_month); %Days
H=floor(Hours); %Hours
Min=floor(Minutes); %seconds

%Getting the YMDHMins
[YMDHMins] = [YMD(:,1) YMD(:,2) D H Min s];
Jd_tt = julianDate(YMDHMins);%Julian Date of TT


[ttt] = julianCentury(Jd_tt); %Julian Centuries of TT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Testing precession function
[prec,psai,wa,ea,xa]=precess_funct(ttt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%












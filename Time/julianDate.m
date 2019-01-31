%AUTHOR: Devan Tormey
%DATE: 12/26/18

%Date 1/31/19 
%Updated as a division factor was left off. 
%Author-Ivan Machuca


function [JD] = julianDate(YMDHMS)
%JULIANDATE Converts from YMDHMS to Julian Date
%   Algorithm detailed on page 183 of Fundamentals of Astrodynamics and
%   Applications

%extracting Variables from vector
yr = YMDHMS(1);
mo = YMDHMS(2);
d = YMDHMS(3);
h = YMDHMS(4);
min = YMDHMS(5);
s = YMDHMS(6);

JD = 367*yr - floor((7*(yr + floor((mo + 9)/(12))))/4) + floor((275*mo)/9)...
    + d + 1721013.5 + (((s/60) + min)/60 + h)/24;



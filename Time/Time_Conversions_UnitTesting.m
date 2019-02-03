%Testing The Algorithms for Time Conversion
%Author: Devan Tormey

clear; clc; close all;
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
% Time Input
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
'Desired output1: May 14 2004 22:46'
utc_in1 = 137803367


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
% Full Unit Test
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`

ConvertedTime1 = TimeConversion(utc_in1);


'Time1 in  UTC (YMDHMS)'
ConvertedTime1{1}
'Time1 in  UT1 (YMDHMS)'
ConvertedTime1{2}
'Time1 in  TT (YMDHMS)'
ConvertedTime1{3}
'Time1 in  TAI (YMDHMS)'
ConvertedTime1{4}

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
% Individual testing
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`



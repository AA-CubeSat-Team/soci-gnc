%Testing The Algorithms for Time Conversion
% AUTHOR: Devan Tormey
% DATE: 12/26/18

utc_in1 = 599572800 %seconds

utc_in2 = 137803367 %seconds

[YMDHMS,JD,JC] = TimeConversion(utc_in1);

[YMDHMS,JD,JC] = TimeConversion(utc_in2)
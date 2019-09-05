clc;
% Example 5-1 Vallado pg 280

JDutc = 2453827.5;

utc = (JDutc - fswParams.constants.global.JDJ2000)*fswParams.constants.convert.DAY2SEC

utc_test = 197208000



r = [0.9771945;0.1924424;0.0834308];

sim('sunVector_test.slx')

r_sun = [r_sun.Data(1);r_sun.Data(2);r_sun.Data(3)];

error = acos(dot(r_sun,r))



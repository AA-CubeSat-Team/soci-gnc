clc
format long g
% From Vallado pg 203 example 3-13
JDutc_in = 2449877.3458762;

j_seconds = (JDutc_in - fswParams.constants.global.JDJ2000)*fswParams.constants.convert.DAY2SEC;



sim('time_test.slx')

ymd_utc_out = ymdhms_utc.data;
JD_utc = JD_utc.Data;

ref_ymd = [1995 6 8 20 18 3.70368];
error_ymd = abs(sum(ref_ymd - ymd_utc_out));

ref_jd_utc = 2449877.3458762;
error_JD_utc = abs(ref_jd_utc - JD_utc);

if (error_ymd < 1e-4 )
    fprintf('ymd passed \n')
    ymd_utc_out
    ref_ymd
    error_ymd
else
    fprintf('ymd failed \n') 
    
end

if (error_JD_utc < 1e-6 )
    fprintf('JD passed \n')
else
    fprintf('JD failed \n')  
    ref_jd_utc
    JD_utc
end

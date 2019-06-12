
JDutc = 2449877.3458762;

utc_s = (JDutc - fswParams.constants.global.JDJ2000)*fswParams.constants.convert.DAY2SEC;

[YMDHMS,JC,JD] = jseconds2ymdhms(utc_s)


[UTC_ymd,UTI_ymd,TT_ymd,TAI_ymd,JD_UTC,JD_UTI,JD_TT,JD_TAI,JC_UTC,JC_UTI,JC_TT,JC_TAI,Time] = time_lib(utc_s,simParams)


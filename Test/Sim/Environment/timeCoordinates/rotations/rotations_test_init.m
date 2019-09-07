clc
%Author - Ivan Machuca


%Constants for DCM
jdut1 = 2453101.82740678; %Julian Dated in UT1
ttt = 0.0426236319; %Julian Centuries in TT

sim('rotations_test.slx')

%Calculating the directional cosine matrix
DCM =sidereal'*nutation'*precess';

%Checking how effectivity of it by calculating the recef and comparing it
%against a tabulated value
recef_actual = [-1033.479383;7901.2952754;6380.3565958];%km
reci = [5102.508958;6123.011401;6378.136928]; %km 
recef_compute = DCM*reci;

tol = 25;%meters
if abs(recef_compute-recef_actual)/1000 <tol
    display('Shits good, nice job')
else
    display('nah nah, try again')
end
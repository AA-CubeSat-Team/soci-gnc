%sim 
%Author Kate Williams
clc;

%calculate magnetic field intensity vector in nano testla units
utc_sec= 1557355288;%test UTC time = 5/8/2019

r = [3829.45; -888.41; 5459.13] ;
v = [0;0;0];
q = q0;
w = [0;0;0];

state = [r;v;q;w];

sim('magField_test.slx');

B_nT_eci=B_nT_eci.Data %units nT
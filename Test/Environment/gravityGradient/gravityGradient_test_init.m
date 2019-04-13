clc 
%Gravity gradient test
reci = [1 1 1]'; %initial position
q = [1 1 1 1]'; %quaternion
w = [1 1 1]';
v = [1 1 1]';

state = [reci;v;q;w];


sim('gravityGradient_test.slx')

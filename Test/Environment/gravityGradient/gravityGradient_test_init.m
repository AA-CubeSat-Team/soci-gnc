%Author I.Machuca
%SOC-I GNC
%Gravity gradient Torques test
%The function of this test is to calculate the torques due to gravity
%gradients as these will be disturbances to our system. 

clc, 
jdut1 = 2453101.82740678; %Julian Dated in UT1
ttt = 0.0426236319; %Julian Centuries in TT
%reci = [5102.508958;6123.011401;6378.136928]; %km position from example 3.13 is Vallado
reci=[0.1;0.1;6371];
time =[ttt;jdut1];
v = [1 1 1]'; %dummy variable for now for velocity
state = [qd;reci;w0;v]; %Example state vector
sim('gravityGradient_test.slx')


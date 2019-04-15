%Author I.Machuca
%SOC-I GNC
%Gravity gradient Torques test
%The function of this test is to calculate the torques due to gravity
%gradients as these will be disturbances to our system. 

clc, 

reci = [5102.508958;6123.011401;6378.136928]; %km position from example 3.13 is Vallado
v = [1 1 1]'; %dummy variable for now for velocity
state = [qd;reci;w0;v]; %Example state vector
sim('gravityGradient_test.slx')


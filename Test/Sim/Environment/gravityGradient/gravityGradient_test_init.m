%Author I.Machuca
%SOC-I GNC
%Gravity gradient Torques test
%The function of this test is to calculate the torques due to gravity
%gradients as these will be disturbances to our system. 

clc, 


UTC = 137803367;
%reci = [5102.508958;6123.011401;6378.136928]; %km position from example 3.13 is Vallado
reci = [0;0;6380]; %km position from example 3.13 is Vallado
%Chose sea level as the position vector to see if my acceleration computed
%from the library would give -9.81 1G. 
v = [1 1 1]'; %dummy variable for now for velocity
w = [0 0 0]';
State = [reci;v;qd;w]; %Example state vector
sim('gravityGradient_test.slx')
g = 9.807;  %Actual acceleration at sea level

if abs(g - norm(accel_eci_mps2)) < 0.5 
    display('acceleration calculated is within 0.5 m/s')
else
    display('acceleration calculated is way off')
end


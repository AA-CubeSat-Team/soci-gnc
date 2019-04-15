clc , 

%Gravity gradient test
reci = [5102.508958;6123.011401;6378.136928]; %km initial position
quat = [0.371;0.649;0.654;0.106];%quaternion
w = [1 1 1]';
v = [1 1 1]';

state = [reci;v;quat;w];


sim('gravityGradient_test.slx')

%Below is an attempted to capture the pitch dynamics of the spacecraft with
%the calculated gravity gradient torques from the sim. 
%Assuming a period of 90 mins for the spacecraft 
T =90;
n = 2*pi/(T*60);
a =sqrt(-3*n^2/J(2,2)*(J(3,3)-J(1,1)));
theta_0 =5*(pi/180);
theta_0dot = -0.1*(pi/180);
t = linspace(0,5);
pitch = Torque_GG(2)/(J(2,2)*a^2) + (theta_0 - Torque_GG(2)/(J(2,2)*a^2))*cos(a*t) + theta_0dot/a^2 *sin(a*t);
plot(t,pitch)
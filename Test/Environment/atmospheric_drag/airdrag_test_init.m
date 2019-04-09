%sim 
%Author Kate Williams
clc; clear;

% ~~~~~~~~~~~~~~~~~~
% Add Paths
% ~~~~~~~~~~~~~~~~~~
addpath(genpath(pwd))
addpath(genpath('../Lib'))
addpath(genpath('../Include'))

definitions;
params;


R= 6.38*10^6+500*10^3;%m, assume orbit of 500km
M=5.98*10^24 ;%kg, mass of earth
vin =sqrt(G*M/R);%m/s

%velocity relative to the atmosphere

%angula velocity of earth assumed to only be in z-direction despite wobble
%bc assumed to be very small, see pg 222 Rdot for x, y components
wx=0; %omega of earth in x direction
wy=0; %omega of earth in y direction

%Inputs to simulation
%vel in m/s, vrel in m/s
vrel = [vin 0 0];%assume for now velocity in only one direction for testing
UTC= 10^6;



lon = 60;    % [deg]
lat  = -70;  % [deg]
height = 500;  % [km]
u_h=[lon;lat;height];

sim('atmoDrag_testModel.slx');

% torque=AtmoTorque_Mn;





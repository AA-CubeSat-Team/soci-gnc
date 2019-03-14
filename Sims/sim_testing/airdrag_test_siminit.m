%sim 
clc; clear;

G=6.673*10^(-11); %N*m^2/kg^2
R= 6.38*10^6+500*10^3;%m, assume orbit of 500km
M=5.98*10^24 ;%kg, mass of earth
vin = sqrt(G*M/R); %m/s

%velocity relative to the atmosphere

%angula velocity of earth assumed to only be in z-direction despite wobble
%bc assumed to be very small, see pg 222 Rdot for x, y components
wx=0; %omega of earth in x direction
wy=0; %omega of earth in y direction

%Inputs to simulation
%vel in m/s, vrel in m/s
vrel = [vin 0 0];%assume for now velocity in only one direction for testing
UTC= 10^6;
muh= 3.986004418e14;%m^3/s^2,assumed constant
u_h= muh/(500e3); %muh/(altitude of cubesat in meters),assumed constant

sim('atmoDrag_lib.slx');



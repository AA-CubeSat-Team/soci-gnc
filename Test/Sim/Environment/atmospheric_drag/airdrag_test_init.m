%sim 
%Author Kate Williams

%Note run Sim_init.m before running this test file

pos=simParams.atmoDrag.pos;%pos is orbit height plus radius of earth
mE=simParams.atmoDrag.mE; %mass of earth
vin =sqrt(G*mE/pos);%m/s

%velocity relative to the atmosphere

%angula velocity of earth assumed to only be in z-direction despite wobble
%bc assumed to be very small, see pg 222 Rdot for x, y components
wx=0; %omega of earth in x direction
wy=0; %omega of earth in y direction

%Inputs to simulation
%vel in m/s, vrel in m/s
vrel = [vin 0 0];%assume for now velocity in only one direction for testing
UTC= 137803367;%test UTC time

lon = 60;    % [deg]
lat  = -70;  % [deg]
height = 500^3;  % [km]
u_h=[lon;lat;height];

sim('atmoDrag_test.slx');

atmo_Force_N=atmo_Force_N.Data
atmo_Torque_Nm=atmo_Torque_Nm.Data





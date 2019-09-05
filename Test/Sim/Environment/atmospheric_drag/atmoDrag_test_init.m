%sim
%Author Kate Williams
%calculate atmospheric drag torque in N*m untis


r = [382.45; -888.41; 545.13] ; %km
v = [0;0;0];
q = q0;
w = [0;0;0];

state = [r;v;q;w];

%velocity relative to the atmosphere

%angula velocity of earth assumed to only be in z-direction despite wobble
%bc assumed to be very small, see pg 222 Rdot for x, y components
wx=0; %omega of earth in x direction
wy=0; %omega of earth in y direction

%Inputs to simulation
%vel in m/s, vrel in m/s
utc_sec= 137803367;%test UTC time

reci = [0;0;6380]; %km position from example 3.13 is Vallado
%Chose sea level as the position vector to see if my acceleration computed
%from the library would give -9.81 1G. 
v = [1 1 1]'; %dummy variable for now for velocity
w = [0 0 0]';
q = qd;
State = [reci;v;q;w]; %Example state vector


sim('atmoDrag_test.slx');

atmo_Force_N=atmo_Force_N.Data
atmo_Torque_Nm=atmo_Torque_Nm.Data





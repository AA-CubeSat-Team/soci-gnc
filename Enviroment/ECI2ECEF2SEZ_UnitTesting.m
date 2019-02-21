%Author Ivan Machuca
%Date 2/6/19

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
% UNIT TESTING OF DCMS ECI -> SEZ
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`

%This function will test the Environment Functions and output coordinates
%in SEZ frame. This function will also go backwards. 
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%Example 3-15 Constants
dUTI = -0.4399619;
xp = -0.140682;
yp = 0.333309; 
Ddeltapsi_1980 = -0.052195;
Ddeltaeps_1980 = -0.003875;
meaneps = -.003875;
jdut1 =   2453101.82740678; % Julian date in ut1

ttt = 0.0426236319; %Taken from example 3-15 Julian Centuries in TT
tut1= 0.0426236114109; %Julian Centuries in ut1
jdut1 =   2453101.82740678; % Julian date in ut1
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

clear all; close all; clc; 


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
%  Inputs
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`

reci = [5102.508958;6123.011401;6378.136928]; %km 
veci = [-4.74322016;0.79053650;5.53375528]; %km/s

ttt = 0.0426236319; %Taken from example 3-15 Julian Centuries in TT
tut1= 0.0426236114109;
jdut1 =   2453101.82740678; % Julian date in ut1


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
% Transforming from ECI2ECEF
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`

[recef,vecef,prec,nut,st]=eci2ecef(ttt,jdut1,reci,veci);
recef_actual = [-1033.479383;7901.2952754;6380.3565958];
vecef_actual = [-3.22563620;-2.872451450;5.531924446];

pos = [recef recef_actual];

error_position = abs(recef-recef_actual)*1000; %calculates the error between our recef and actual in meters
error_velocity = abs(vecef-vecef_actual)*1000; %calculates the error between our recef and actual in meters

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
% Transforming from ECEF_to_LatLon
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`

%recef should be -1033.479383,7901.2952754,6380.3565958
%vecef should be -3.22563620;-2.872451450;5.531924446;

[phi,lamda,he] = ECEF_to_LatLon(recef);

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
% Going backwards : Transforming from Latlon_to_ECEF
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
[r_ecef] = LatLon2ecef(lamda,phi,he); 
error_recef = abs(r_ecef - recef)*1000; %difference in position vector from going to lat/lon and then reverse in meters

% ~~~~~~~~~~~~~~~~~~~~~~~~~~`
%Transforming from ECEF2ECI
% ~~~~~~~~~~~~~~~~~~~~~~~~~~`
r_eci = prec*nut*st*r_ecef; 
error_reci = abs(reci-r_eci)*1000; % difference in position vector going from eci to SEZ and then going in reverse in meters









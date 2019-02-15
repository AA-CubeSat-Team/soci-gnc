%Author Ivan Machuca
%Date 2/6/19

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
% UNIT TESTING OF DCMS ECI -> SEZ
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`

%This function will test the Environment Functions and output coordinates
%in SEZ frame. This function will also go backwards. This test function
%will evaluate 
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


ttt = 0.0426236319; %Taken from example 3-15 Julian Centuries in TT
tut1= 0.0426236114109;
jdut1 =   2453101.82740678; % Julian date in ut1


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
% Transforming from ECI2ECEF
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`

[recef]=eci2ecef(ttt,jdut1,reci);
recef_actual = [-1033.479383,7901.2952754,6380.3565958]';
pos = [recef recef_actual];

error = abs(recef-recef_actual)*1000; %calculates the error between our recef and actual in meters

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
% Transforming from ECEF_to_LatLon
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`

%recef should be-1033.479383,7901.2952754,6380.3565958
[phi,lamda,he] = ECEF_to_LatLon(recef);

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
% Going backwards : Transforming from Latlon_to_ECEF
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
[r_ecef] = LatLon2ecef(lamda,phi,he);

% ~~~~~~~~~~~~~~~~~~~~~~~~~~`
%Transforming from ECEF2ECI
% ~~~~~~~~~~~~~~~~~~~~~~~~~~`


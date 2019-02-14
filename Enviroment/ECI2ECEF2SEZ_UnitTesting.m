%Author Ivan Machuca
%Date 2/6/19

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
% UNIT TESTING OF DCMS ECI -> SEZ
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`

%This function will test the Environment Functions and output coordinates
%in SEZ frame. This function will also go backwards. This test function
%will evaluate Example 3-15

clear all; close all; clc; 


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
%  Inputs
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`

reci = [5102.508958;6123.011401;6378.136928]; %km 


ttt = 0.0426236319; %Taken from example 3-15 Julian Centuries in TT
tut1= 0.0426236114109;
jdut1 = 2453101.82740678; 


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
% Transforming from ECI2ECEF
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`

[recef]=eci2ecef(ttt,jdut1,reci);
recef_actual = [-1033.479383,7901.2952754,6380.3565958]';
pos = [recef recef_actual];


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
% Transforming from ECEF_to_LatLon
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`

%recef should be-1033.479383,7901.2952754,6380.3565958
[phi,lamda,he] = ECEF_to_LatLon(recef);

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
% Going backwards : Transforming from Latlon_to_ECEF
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`


% ~~~~~~~~~~~~~~~~~~~~~~~~~~`
%Transforming from ECEF2ECI
% ~~~~~~~~~~~~~~~~~~~~~~~~~~`


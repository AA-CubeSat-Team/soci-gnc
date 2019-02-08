%Author Ivan Machuca
%Date 2/6/19

%This function will test the Environment Functions and output coordinates
%in SEZ frame. This function will also go backwards. This test function
%will evaluate Example 3-15

clear all; close all; clc; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inputs
reci = [-1033.479383;7901.2954;6380.3565958]; %km 
ttt = 0.0426236319; %Taken from example 3-15 Julian Centuries in TT
jdut1= 0.0426236114109;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Transforming from ECI2ECEF
[recef]=eci2ecef(ttt,jdut1,reci);

%recef should be 5102.508,6123.001,6378.136928
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Transforming from ECEF_to_LatLon
[phi,lamda,he] = ECEF_to_LatLon(recef);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Going backwards : Transforming from Latlon_to_ECEF

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Transforming from ECEF2ECI


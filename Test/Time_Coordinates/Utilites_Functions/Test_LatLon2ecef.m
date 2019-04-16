%Author Ivan Machuca
%Revision Data 1/17/19
clear all;close all;clc; 

%Testing the LatLon2ecef function
%Checking Example 3-3 from the Textbook 
he=5085.22;  %Altitude in Km
phi=34.352496; %Latitude in degrees
l=46.4464; %Longitude in degrees
r_ecef = LatLon2ecef(l,phi,he);

%checking to see if output is the same. %should get
%rECEF = 6524.834,6862.875,6448.296 Km


%Testing ECEF_to_LatLon
recef = [6524.814;6862.875;6448.296];
[phi,lamda,he] = ECEF_to_LatLon(recef);

r_ecef = LatLon2ecef(lamda,phi,he);

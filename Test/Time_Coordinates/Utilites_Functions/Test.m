% TITLE: Test Script for ECEF to LatLon Algorithm
% AUTHOR: Devan
% Date: 1/17/2019
clc; clear all;
r_ecef = [6524.834, 6862.875, 6448.296];

[phi,l,he] = ECEF_to_LatLon(r_ecef)


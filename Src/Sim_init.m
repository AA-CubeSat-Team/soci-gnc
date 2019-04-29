%Author: Devan Tormey
%Title: Simulation Initialization 
%Description:

clear; clc; close all;

% ~~~~~~~~~~~~~~~~~~
% Add Paths
% ~~~~~~~~~~~~~~~~~~
addpath(genpath(pwd))
addpath(genpath('../Lib/'))
addpath(genpath('../Include/'))

definitions;
params;


% Turning off and on 
SP_ON = 1;
GG_ON = 1;
ATMO_ON = 0;



%choices for Kp and Kd depend on zeta and wn

z = 1; %Critically Damped
% z = .7 %Damped
% z = .1 %under damped



% wn is based on the assumption that our impulses are around this frequency
% A couple different choices for wn are dependant on what kinda stuff we
% think we need ot react to
wn = .017; %this corresponds to attenuating signals above 1 degree per second
wn = .017*2; %this corresponds to doubling ^^
% wn = .007 %assuming 60 degrees in 5 minutes

Kd = 2*z*wn*J;
Kp = wn.^2*J;



qd =[ 1;
      0;
      0;
      0];
% 
% kd = 10
% kp = 1


% sim('Main_Sim.slx')

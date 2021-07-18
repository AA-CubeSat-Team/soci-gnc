 % SOC-i Simulation Initialization 
%
% This file is always the first thing that should be run when doing
% anything with this repository

clear; close all;

% ~~~~~~~~~~~~~~~~~~~~~
% Add Paths
% ~~~~~~~~~~~~~~~~~~~~~


% ~~~~~~~~~~~~~~~~~~~~~
% Initialize Parameters
% ~~~~~~~~~~~~~~~~~~~~~
init_params; 

simParams.initialConditions.rwa.radps=diag([1 1 1 1])*simParams.initialConditions.rwa.radps;
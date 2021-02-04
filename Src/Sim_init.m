% SOC-i Simulation Initialization 
%
% This file is always the first thing that should be run when doing
% anything with this repository

clear; close all;

% ~~~~~~~~~~~~~~~~~~~~~
% Add Paths
% ~~~~~~~~~~~~~~~~~~~~~
addpath(genpath(pwd))
addpath(genpath('../Lib/'))
addpath(genpath('../Include/'))
addpath(genpath('../Test/'))

% ~~~~~~~~~~~~~~~~~~~~~
% Initialize Parameters
% ~~~~~~~~~~~~~~~~~~~~~
init_params; 
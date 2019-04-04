% Atmospheric Drag Simulation Initialization
%Author Kate Williams
% Description: Create variables for running the atmospheric drag model.

addpath(genpath(pwd))
addpath(genpath('../Lib'))
addpath(genpath('../Include'))

muh= 3.986004418e14;%m^3/s^2,assumed constant
%u_h= muh/(500e3); %muh/(altitude of cubesat in meters),assumed constant
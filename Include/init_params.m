% Parameters Initialization
% ~~~~~~~~~~~~~~~~~~~~~~~~~
% Author: Devan Tormey
% Description: this file sets up the two structs containing all of the
% variables for both flight software and simulink simulations

% TLE 
TLE = 'ISS.txt';

% Turning off and on 
SP_ON   = 1;
GG_ON   = 1;
ATMO_ON = 1;

%FSW 
fswParams = struct;

% FSW Parameters 
fswParams.sample_time_s = 0.1;

% Sim Parameters 
simParams = struct;
simParams.sample_time_s = 0.005; %sample at 200Hz

% initialize utility constants such as conversion rates
constants_init;

% The spacecraft Parameters such as weight and dimensions
scParams_init;

% Create initial conditions such or Orbital elements and q0/w0
intitialConditions_init;

% Constants associated with the time conversions
time_init;

% sets up the constants for the atmospheric drag model
atmoDrag_init;

% sets up constants associated with the solar pressure model
solarPressure_init;

% sets up constants associated with the solar pressure model
gravityGrad_init;

% sets up constants associated with the magnetic field model
magField_init;

% sets up constants associated with the actuators
actuators_init;

% sets up constants associated with the sesnors
sensors_init;

%Initialize the controller
pdController_init;
SlewAndControlConstrained_init;

% Initialize Estimation
% >> Kylle <<

% initialize sgp4 and orbit propogation
sgp4_init;



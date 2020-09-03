% Parameters Initialization
% ~~~~~~~~~~~~~~~~~~~~~~~~~
% Author: Devan Tormey
% Description: this file sets up the two structs containing all of the
% variables for both flight software and simulink simulations

% TLE 
TLE = 'ISS.txt';
load('fswBusDefinitions.mat')
load('simBusDefinitions.mat')

% main structs defined by default config file
[fswParams,simParams] = default_config();

% initialize utility constants such as conversion rates
[fswParams,simParams] = constants_init(fswParams,simParams);

% The spacecraft Parameters such as weight and dimensions
[fswParams,simParams] = scParams_init(fswParams,simParams);

% Create initial conditions such or Orbital elements and q0/w0
[fswParams,simParams] = intitialConditions_init(fswParams,simParams,TLE);

% Constants associated with the time conversions
[fswParams,simParams] = time_init(fswParams,simParams);

% sets up the constants for the atmospheric drag model
% [fswParams,simParams] = atmoDrag_init(fswParams,simParams);

% sets up constants associated with the solar pressure model
[fswParams,simParams] = solarPressure_init(fswParams,simParams);

% sets up constants associated with the solar pressure model
% [fswParams,simParams] = gravityGrad_init(fswParams,simParams);

% sets up constants associated with the magnetic field model
% [fswParams,simParams] = magField_init(fswParams,simParams);

% sets up constants associated with the actuators
[fswParams,simParams] = actuators_init(fswParams,simParams);

% sets up constants associated with the allocator
[fswParams,simParams] = allocator_init(fswParams,simParams);

% sets up constants associated with the sesnors
[fswParams,simParams] = sensors_init(fswParams,simParams);

% sets up constants associated with the controllers
[fswParams,simParams] = controllers_init(fswParams,simParams);

% sets up constants associated with the estimators
[fswParams,simParams] = MEKF_init(fswParams,simParams);

% Initialize Environmental Estimation
[fswParams,simParams] = environmentEstimation_init(fswParams,simParams);

% Initialize various FSW parameters
FSW_init;

% Initialize SOAR
[fswParams,simParams] = init_soar_params(fswParams,simParams);

% initialize sgp4 and orbit propogation
% sgp4_init;
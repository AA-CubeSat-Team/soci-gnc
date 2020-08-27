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
actuators_init;

% sets up constants associated with the allocator
allocator_init;

% sets up constants associated with the sesnors
sensors_init;

%Initialize the controller
controllers_init;


% Initialize Estimation
% >> Kylle <<
init_MEKF;

% Initialize State Estimation
% attitude_estimation_init;


% Initialize Environmental Estimation
environmentEstimation_init;

% Initialize various FSW parameters
FSW_init;

% Initialize SOAC
init_soac_params;

% initialize sgp4 and orbit propogation
% sgp4_init;
% Parameters Initialization
% ~~~~~~~~~~~~~~~~~~~~~~~~~
% Author: Devan Tormey
% Description: this file sets up the two structs containing all of the
% variables for both flight software and simulink simulations

% TLE 
TLE = 'ISS.txt';

% main structs
fswParams = struct;
simParams = struct;

% Turning off and on 
simParams.opts.SP_ON   = 1;
simParams.opts.GG_ON   = 1;
simParams.opts.ATMO_ON = 1;

% FSW Parameters 
fswParams.sample_time_s = 0.1;      % sample at 10Hz

% Sim Parameters 
simParams.sample_time_s = 0.1;    % sample at 200Hz

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

% initialize sgp4 and orbit propogation
% sgp4_init;
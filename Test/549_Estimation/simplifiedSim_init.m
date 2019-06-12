

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Set Initial Conditions
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~
% This part has to set up all of the parameters to run in the sim.
% this includes the orbital elements for our 500km ISS orbit

t0 = simParams.time.epoch_utc_s;

[YMDHMS] = TimeConversion(t0,simParams);

YMDHMS = YMDHMS.'


    DEG2RAD         = fswParams.constants.convert.DEG2RAD;
    REVpD2RADpM     = 2*pi/1440;
    

    INC     = 54.6146;  % inclination
    RAAN    = 247.4627; % right ascension of ascending node
    ECC     = 0006703; % keep this w/o decimals and 7 digits
    AOP     = 130.5360; % arg of perigee
    MNA     = 325.0288; % mean anomaly
    MNM     = 15.72125391; % mean motion
    
    % Generate TLE (saved as text file in /adcs_sim/matlab/include/TLEs/
    sgp4.orbit_tle = TLE_gen(YMDHMS, INC, RAAN, ECC, AOP, MNA, MNM);

    % Add individual quantities to SGP4 struct (correct units)
    sgp4.year    = sgp4.orbit_tle(1);
    sgp4.JD_UTC_epoch_J2000 = sgp4.orbit_tle(2);
    sgp4.B_star  = sgp4.orbit_tle(3);
    sgp4.INC     = sgp4.orbit_tle(4)*DEG2RAD;       % [rad]
    sgp4.RAAN    = sgp4.orbit_tle(5)*DEG2RAD;       % [rad]
    sgp4.ECC     = sgp4.orbit_tle(6);               % [-]
    sgp4.AOP     = sgp4.orbit_tle(7)*DEG2RAD;       % [rad]
    sgp4.MNA     = sgp4.orbit_tle(8)*DEG2RAD;       % [rad]
    sgp4.MNM     = sgp4.orbit_tle(9)*REVpD2RADpM;   % [rad/min]
    
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Set up GPS time for Time Lib
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    GPS_time = [129600; 2034];
%     18 seconds added to GPS time
    GPS_time(1) = GPS_time(1) + 18;
    
% ~~~~~~~~
% Set up the actual quaternion we need to estimate
% ~~~~~~~~

    simParams.initialConditions.q0 = [.5 .5 .5 .5]';
    
    
% Clear The unecessary variables    
    clear AOP DEG2RAD ECC INC MNA MNM RAAN REVpD2RADpM YMDHMS
    
% Run Sim.
    sim('simplifiedSim')
% Save Workspace.
filename = 'simData';
save('simData')


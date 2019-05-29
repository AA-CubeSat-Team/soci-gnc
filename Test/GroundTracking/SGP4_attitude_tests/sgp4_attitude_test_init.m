

t0 = simParams.time.epoch_utc_s;

[YMDHMS,JD,JC] = TimeConversion(t0);

YMDHMS = YMDHMS{1}.'

    % Conversions
    DEG2RAD         = fswParams.constants.convert.DEG2RAD;
    REVpD2RADpM     = 2*pi/1440;
    
    % Define our orbit
%     YMDHMS  = [ 2019; 1; 1; 0; 0; 0 ]
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
    
   
    GPS_time = [129600; 2034];

% fswParams.orbit_tle = orbit_tle;

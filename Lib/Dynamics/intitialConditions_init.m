function [fswParams,simParams] = intitialConditions_init(fswParams,simParams,TLE)
%INITIALCONDITIONS_INIT
%
% Define the initial conditions for the state vector used by the sim
%
% T. P. Reynolds

ic      = struct;
time    = struct;

% pull relevant data from the TLE
[orbit_tle,~] = get_tle(TLE); 

%%   Time and Rotations 

% offsets for time frame change
time.DUT1 = -0.0361535; % UTC -> UT1 offset (this is date specific)
time.TAI_offset = 37;   % UTC -> TAI offset
time.DTT_TAI = 32.184;  % TAI -> TT offset
% epoch year (assuming it is AFTER the year 2000)
time.Y_epoch = 2000 + orbit_tle(1);
% Mission start time (orbit_tle(2) is epoch in JD_UTC_J2000)
time.epoch_utc_s = orbit_tle(2) * simParams.constants.convert.DAY2SEC;

% map a MET of zero to various time definitions
[YMDHMS_UTC,~,JD_UTC,~,~,JC_UT1_J2000,JC_TT_J2000] = ...
            matlab_time_lib(time.epoch_utc_s,time);
JD_J2000_UTC = JD_UTC - simParams.constants.global.JDJ2000;
% compute initial rotation matrices
[ecef_2_eci, ~, ~, teme_to_eci] = ...
            matlab_coordinate_rotations(JC_UT1_J2000, JC_TT_J2000);
ic.YMDHMS_UTC = YMDHMS_UTC;
ic.JD_UTC     = JD_UTC;
ic.ecef_2_eci = ecef_2_eci;

%%   Attitude dynamics   

ic.q_eci2body   = [ 0.12; -0.31; 0.9; 0.28 ];
ic.q_eci2body   = ic.q_eci2body./norm(ic.q_eci2body);
ic.w_body_radps = [ 0.0; 0.0; 0.0 ];
 
%%   Orbital  dynamics   

% compute inertial position and velocity using SGP4 since this is what FSW will
% do (note that TLEs give this in the TEME frame)
[r0_teme_km,v0_teme_kmps,~] = matlab_sgp4(JD_J2000_UTC,orbit_tle);
% convert to ECI pos/vel
ic.r_eci_km     = teme_to_eci * r0_teme_km;
ic.v_eci_kmps	= teme_to_eci * v0_teme_kmps;
% compute initial LLA
r_ecef_m = simParams.constants.convert.KM2M * ( ecef_2_eci' * ic.r_eci_km );
lla = ecef2lla(r_ecef_m');
ic.lat_deg = lla(1);
ic.lon_deg = lla(2);
ic.alt_m   = lla(3);
% collect state into one signal
ic.all = [ ic.r_eci_km; 
           ic.v_eci_kmps; 
           ic.q_eci2body; 
           ic.w_body_radps ];

%%  Add to main struct

simParams.time              = time;
simParams.initialConditions = ic;
simParams.orbit_tle         = orbit_tle;

end

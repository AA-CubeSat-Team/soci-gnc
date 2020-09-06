function [fswParams,simParams] = intitialConditions_init(fswParams,simParams,TLE)
%INITIALCONDITIONS_INIT
%
% Define the initial conditions for the state vector used by the sim
%
% T. P. Reynolds

ic = struct;

%   Attitude dynamics   %
% qt = rand(4,1);
% initialConditions.q0 = qt/norm(qt);
ic.q_eci2body   = [1;0;0;0];
% initialConditions.w0 = rand(3,1); 
ic.w_body_radps = [ 0.000; 0.000; 0.000 ];
 
%   Orbital  dynamics   %
[orbit_tle,~]           = get_tle(TLE); % Pull orbital data from desired TLE
oev                     = tle2orb(orbit_tle); % keplerian orbital elements
[r0_eci_m,v0_eci_mps]   = orb2eci(oev); % convert to ECI pos/vel
r0_eci_km               = fswParams.constants.convert.M2KM * r0_eci_m;
v0_eci_kmps             = fswParams.constants.convert.M2KM * v0_eci_mps;
ic.r_eci_km             = r0_eci_km;
ic.v_eci_kmps           = v0_eci_kmps;

% Collect into one signal
ic.all = [ ic.r_eci_km; 
           ic.v_eci_kmps; 
           ic.q_eci2body; 
           ic.w_body_radps ];

simParams.initialConditions = ic;
simParams.orbit_tle = orbit_tle;

end

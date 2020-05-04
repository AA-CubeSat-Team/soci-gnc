initialConditions = struct;

% ~~~~~~~~~~~~~~~~~~~~~ %
%   Attitude dynamics   %
% ~~~~~~~~~~~~~~~~~~~~~ %
% qt = rand(4,1);
% initialConditions.q0 = qt/norm(qt);
initialConditions.q0 = [1;0;0;0];
% initialConditions.w0 = rand(3,1); 
 initialConditions.w0 = [ 0.100; -0.100; 0.100 ];
 
% ~~~~~~~~~~~~~~~~~~~~~ %
%   Orbital  dynamics   %
% ~~~~~~~~~~~~~~~~~~~~~ % 

% Pull orbital data from desired TLE
[orbit_tle,~]           = get_tle(TLE);
oev                     = tle2orb(orbit_tle); % keplerian orbital elements
[r0_eci_m,v0_eci_mps]   = orb2eci(oev);
r0_eci_km               = fswParams.constants.convert.M2KM * r0_eci_m;
v0_eci_kmps             = fswParams.constants.convert.M2KM * v0_eci_mps;
initialConditions.r0    = r0_eci_km;
initialConditions.v0    = v0_eci_kmps;

% Collect into one signal
initialConditions.all   = [ initialConditions.r0; initialConditions.v0;
                            initialConditions.q0; initialConditions.w0 ];
simParams.initialConditions = initialConditions;
simParams.orbit_tle     = orbit_tle;

clear qt orbit_tle oev r0_eci_km v0_eci_kmps initialConditions;
clear r0_eci_m v0_eci_mps

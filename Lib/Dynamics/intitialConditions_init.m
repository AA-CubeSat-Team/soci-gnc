initialConditions = struct;

% ~~~~~~~~~~~~~~~~~~~~~ %
%   Attitude dynamics   %
% ~~~~~~~~~~~~~~~~~~~~~ %
% qt = rand(4,1);
% initialConditions.q0 = qt/norm(qt);
initialConditions.q0 = [1;0;0;0];
% initialConditions.w0 = rand(3,1); 
 initialConditions.w0 = [0;0;0];
 
% ~~~~~~~~~~~~~~~~~~~~~ %
%   Orbital  dynamics   %
% ~~~~~~~~~~~~~~~~~~~~~ % 

% Pull orbital data from desired TLE
[orbit_tle,~] = get_tle(TLE);
oev = tle2orb(orbit_tle); % keplerian orbital elements
[r0_eci_m,v0_eci_mps] = orb2eci(oev);
r0_eci_km   = fswParams.constants.convert.M2KM * r0_eci_m;
v0_eci_kmps = fswParams.constants.convert.M2KM * v0_eci_mps;
initialConditions.r0 = r0_eci_km;
initialConditions.v0 = v0_eci_kmps;

% % ~~~~~~~~~~~~~~~~~~~~~
% % Option 1 equitorial Orbit
% % ~~~~~~~~~~~~~~~~~~~~~
% % Calculate an initial r and v
% r = [500+fswParams.constants.global.r_earth_km;0;0];
% v = [0;sqrt(fswParams.constants.global.mu_earth_km3s2/norm(r));0];
% initialConditions.r0 = r;
% initialConditions.v0 = v;

% % ~~~~~~~~~~~~~~~~~~~~~
% % Option 2 ISS Orbit (From NASA Website)
% % ~~~~~~~~~~~~~~~~~~~~~
% r = [-2447628.5;4868517.89;-4051581.44]*10^(-3);
% v = [-6580.108569;-49.846368;3920.219467]*10^(-3);
% initialConditions.r0 = r;
% initialConditions.v0 = v;

% % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% % Option 3 ISS Orbit From Initial TLE
% % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% t0 = simParams.time.epoch_utc_s; %Initial Time (From time_init.m)
% % Orbital Elements
% r = [-2447628.5;4868517.89;-4051581.44]*10^(-3);
% v = [-6580.108569;-49.846368;3920.219467]*10^(-3);
% initialConditions.r0 = r;
% initialConditions.v0 = v;

initialConditions.all   = [ initialConditions.r0; initialConditions.v0;
                            initialConditions.q0; initialConditions.w0 ];
simParams.initialConditions = initialConditions;
simParams.orbit_tle     = orbit_tle;

clear qt orbit_tle oev r0_eci_km v0_eci_kmps initialConditions;

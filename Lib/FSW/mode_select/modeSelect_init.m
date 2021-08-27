function [fswParams,simParams] = modeSelect_init(fswParams,simParams)
%MODESELECT_LIB
%
% Initialize the GNC mode selection library.
%
% C. Morgan

mode_select = struct;

mode_select.gnc_mode_ic                 = uint8(3);
mode_select.body_rate_threshold_max     = 12.5*pi/180;  %rad/s
mode_select.body_rate_threshold_min     = .5*pi/180; %rad/s
% mode_select.RWA_RPM_threshold_max_inf   = 5000;    %RPM. limits max indv rpm
% mode_select.RWA_RPM_threshold_min_inf   = 1500;    %RPM.
% mode_select.RWA_RPM_threshold_max_2norm = 2*3000;  %RPM. limits total power
% mode_select.RWA_RPM_threshold_min_2norm = 2*1100;  %RPM. 
mode_select.h_max                       = norm(fswParams.scParams.J * [0.2;0;0]);
mode_select.h_min                       = norm(fswParams.scParams.J * [0.1;0;0]);
% compute orbital period
coe = tle2orb(simParams.orbit_tle);
muE = simParams.constants.global.mu_earth_km3s2;
mode_select.orbital_period_s            = 2*pi*sqrt(coe(1)^3/muE); % seconds
mode_select.desat_timer_buffer_s        = 30;                      % seconds

% add to main struct
fswParams.mode_select = mode_select;

end


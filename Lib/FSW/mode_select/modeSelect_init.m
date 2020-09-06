function [fswParams,simParams] = modeSelect_init(fswParams,simParams)
%MODESELECT_LIB
%
% Initialize the GNC mode selection library.
%
% C. Morgan

mode_select = struct;

mode_select.sc_mode_ic                  = int8(1.0);
mode_select.body_rate_threshold_max     = 9*pi/180;  %rad/s
mode_select.body_rate_threshold_min     = .5*pi/180; %rad/s
mode_select.RWA_RPM_threshold_max_inf   = 5000;    %RPM. limits max indv rpm
mode_select.RWA_RPM_threshold_min_inf   = 1100;    %RPM.
mode_select.RWA_RPM_threshold_max_2norm = 2*3000;  %RPM. limits total power
mode_select.RWA_RPM_threshold_min_2norm = 2*1100;  %RPM. 
mode_select.orbital_period_s            = 91*60.0; %seconds
mode_select.desat_timer_buffer_s        = 30;      %seconds

% add to main struct
fswParams.mode_select = mode_select;

end


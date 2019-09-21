%BDOTCONTROLLER_INIT
%
% Loads the parameters of the b-dot  controller using predefined fswParams.
%
% T.Reynolds

% Library sample time
bdot.sample_time_s  = fswParams.sample_time_s;

% Initial conditions
bdot.ic.RT_b_meas_valid = 0;
bdot.ic.RT_b_body_T     = [0 0 0]';
bdot.ic.RT_dipole       = [0 0 0]';
bdot.ic.derivative      = 0;
bdot.ic.unit_delay      = [0 0 0]';
bdot.ic.invalid_input   = [0 0 0]';

% Make sure gains are negative
bdot.gain_matrix = ...
    diag([- fswParams.actuators.mtq.dipole_max_Am2(1)/1.5e-6,...
          - fswParams.actuators.mtq.dipole_max_Am2(2)/1.5e-6,...
          - fswParams.actuators.mtq.dipole_max_Am2(3)/1.7e-7]);
                           
% Filter coefficients      
bdot.cutoff_freq    = 2*pi*0.1; % [rad/s]
lpf_c               = tf([bdot.cutoff_freq],[1 bdot.cutoff_freq]);
lpf_d               = c2d(lpf_c,bdot.sample_time_s);
[lpf_num,lpf_den]   = tfdata(lpf_d,'v');
% Extract second component only for use in filter
bdot.filter_num     = lpf_num(2);
bdot.filter_den     = lpf_den(2);

fswParams.controllers.bdot = bdot;
clear lpf_c lpf_d lpf_num lpf_den bdot
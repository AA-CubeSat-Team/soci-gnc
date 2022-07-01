function [fswParams,simParams] = default_config(tle_filenamme)
%DEFAULT_CONFIG
%
% Sets some of the basic parameters for the sim. This function creates the
% initial fswParams and simParams structs and defines the fsw/sim sample
% rates. Note that the open('Main_Sim.slx') is needed to properly
% initialize the default values of the CDH commands
%
% T. P. Reynolds

% Open the main sim.
open('Main_Sim.slx')

% main structs
fswParams = struct;
simParams = struct;

% simlation options
simParams.opts.configure_for_flatsat = false;
simParams.opts.SP_ON   = 1;
simParams.opts.GG_ON   = 1;
simParams.opts.ATMO_ON = 1;
simParams.opts.sensor_noise = 1;
simParams.opts.actuator_model = 0;
simParams.opts.tle_filename = tle_filenamme;

% FSW Parameters 
fswParams.sample_time_s = 1/4;     % flight software sample rate

% Sim Parameters s
simParams.sample_time_s = (1/20) * fswParams.sample_time_s; % sample 20x faster

% Set initial CDH commands
cdh = Simulink.Mask.get('Main_Sim/CDH_command_lib');
target_lat_deg = cdh.Parameters(1);
target_lat_deg.set('Value','44.0');
%
target_lon_deg = cdh.Parameters(2);
target_lon_deg.set('Value','-76.5');
%
target_alt_m = cdh.Parameters(3);
target_alt_m.set('Value','0.0');
%
override_autonomy = cdh.Parameters(4);
override_autonomy.set('Value','0');
%
enable_pointing = cdh.Parameters(5);
enable_pointing.set('Value','on');
%
force_clpm = cdh.Parameters(6);
force_clpm.set('Value','off');
%
force_lpm = cdh.Parameters(7);
force_lpm.set('Value','off');
%
enable_img = cdh.Parameters(8);
enable_img.set('Value','off');
%
enable_soar = cdh.Parameters(9);
enable_soar.set('Value','off');
%
triad_override = cdh.Parameters(10);
triad_override.set('Value','off');
%
MET_soar_utc_s = cdh.Parameters(11);
MET_soar_utc_s.set('Value','simParams.time.epoch_utc_s+500');
%
quat_soar_cmd = cdh.Parameters(12);
quat_soar_cmd.set('Value','[0.200869388727445;-0.603600311719593;-0.740781711514794;-0.215779072779279]');

end
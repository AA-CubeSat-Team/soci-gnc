function [fswParams,simParams] = groundpass_predict_init(fswParams,simParams)
%GROUNDPASS_PREDICT_INIT
%
% Defines parameters for the COM and IMG pointing targets. Currently only
% designed to store one of each.
%
% T. P. Reynolds

targ = struct;
DEG2RAD = fswParams.constants.convert.DEG2RAD;

%% For the prediction of the UW AERB ground station
targ(1).lat_gd_deg   = 47.655548;   % deg
targ(1).lon_deg      = -122.3032;   % deg
targ(1).alt_m        = 0;           % meters altitude
targ(1).ll_deg       = [ targ(1).lat_gd_deg, targ(1).lon_deg ];

% compute the rotation matrix from COM frame to ECEF
lat_gd_rad = DEG2RAD * targ(1).lat_gd_deg;
lon_rad    = DEG2RAD * targ(1).lon_deg;
targ(1).C_F2T = rot(-(pi/2 - lat_gd_rad),'y')' * rot(-lon_rad,'z')'; 

% map to an ecef position vector
targ(1).ecef_m = lla2ecef([ targ(1).lat_gd_deg, targ(1).lon_deg, targ(1).alt_m ])';

% minimum elevation to declare us "over" a target
targ(1).min_elev_rad = DEG2RAD * 10;

%% Define a second ground target 
targ(2).lat_gd_deg   = 44.233334;   % deg
targ(2).lon_deg      = -76.500000; % deg
targ(2).alt_m        = 0;          % meters altitude
targ(2).ll_deg       = [ targ(2).lat_gd_deg, targ(2).lon_deg ];

% compute the rotation matrix from COM frame to ECEF
lat_gd_rad = DEG2RAD * targ(2).lat_gd_deg;
lon_rad    = DEG2RAD * targ(2).lon_deg;
targ(2).C_F2T  = rot(-(pi/2 - lat_gd_rad),'y')' * rot(-lon_rad,'z')'; 

% map to an ecef position vector
targ(2).ecef_m = lla2ecef([ targ(2).lat_gd_deg, targ(2).lon_deg, targ(2).alt_m ])';

% minimum elevation to declare us "over" a target
targ(2).min_elev_rad = DEG2RAD * 10;
 
%% Add to main struct 
fswParams.ground_targs = targ;
% fswParams.ground_targs(2).targ = img;

end


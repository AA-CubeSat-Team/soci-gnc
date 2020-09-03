function [fswParams,simParams] = environmentEstimation_init(fswParams,simParams)
%ENVIRONMENTESTIMATION_INIT 
% 
% Initialization of the environmental estimation.
%
% Author: Cole Morgan

gp_predict = struct;

% For the prediction of the UW AERB ground station only. Some targets may
% be arbitrarily requested.
gp_predict.gs.lat    = 47.653975;   % deg
gp_predict.gs.lon    = -122.305736; % deg
gp_predict.gs.alt    = 44;          % meters altitude
gp_predict.gs.latlon = [ gp_predict.gs.lat, gp_predict.gs.lon];

% This will act as the latitude buffer that defines part of a rectangle around 
% our target. Degrees field of view, doubles as latitude buffer
gp_predict.fov_ang_deg = 15; 
% Close to 3 minutes worth of degrees for our 96min orbit so we can start 
% manuevering early
gp_predict.lon_buffer_pre = 3*360/96; 
% No need to spend time aiming at target long afer passover
gp_predict.lon_buffer_post = gp_predict.lon_buffer_pre/3; 

% Limits the maximum requested latitude of a target to something reasonable
% within our orbital inclination.
gp_predict.target_lat_limit = 54.6146 + gp_predict.fov_ang_deg;
% Essentially just protects against a weird typo
gp_predict.target_lon_limit = 180;
 
% Add to main struct %
fswParams.gp_predict = gp_predict;

end
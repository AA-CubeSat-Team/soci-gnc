% Initialization of the environmental estimation.
%
%
% Author: Cole Morgan


gp_predict = struct;

% For the prediction of the UW AERB ground station only. Some targets may
% be arbitrarily requested.
gp_predict.gs.latlon = [47.653975, -122.305736]; % [lat, long] degrees of gs
gp_predict.gs.lat    = 47.653975; % deg
gp_predict.gs.lon    = -122.305736; % deg
gp_predict.gs.alt    = 44; % meters altitude

fov_ang              = 15; % This will act as the latitude buffer that defines 
                           % part of a rectangle around our target.
gp_predict.lon_buffer_pre  = 3*360/96; % close to 3 minutes worth of degrees for our 96min orbit
                                       % so we can start manuevering early
gp_predict.lon_buffer_post = gp_predict.lon_buffer_pre/3; % no need to spend time aiming at target long
                                                          % afer passover
gp_predict.fov_ang         = fov_ang; % degrees field of view. doubles as latitude buffer

% Limits the maximum requested latitude of a target to something reasonable
% within our orbital inclination.
gp_predict.target_lat_limit = 54.6146 + fov_ang;
gp_predict.target_lon_limit = 180; % essentially just protects against a weird typo.
 

fswParams.gp_predict = gp_predict;

clear gp_predict fov_ang
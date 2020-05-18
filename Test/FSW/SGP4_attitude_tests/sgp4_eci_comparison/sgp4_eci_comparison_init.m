% Essentially to address issues 26 and 27.
% test why our state vector seems to be orbit raising,
% and can also be used to see if state vector and sgp4
% output agree.
%
%
%
% Author: Cole Morgan

clc;

% controller1 = struct;

simParams.sample_time_s = 0.1;
fswParams.sample_time_s = simParams.sample_time_s;
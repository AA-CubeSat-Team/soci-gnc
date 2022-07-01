function [simParams] = FlatSat_init(fswParams, simParams)
%FLATSAT_CONFIG
%
% Sets some of the basic parameters for the flatsat read/write libraries.
%
% T. P. Reynolds
flatsat = struct;

% Sample times
flatsat.photodiode_sample_time_s = fswParams.sample_time_s;
flatsat.magnetometer_sample_time_s = fswParams.sample_time_s;
flatsat.gyroscope_sample_time_s = fswParams.sample_time_s;

% Add flatsat struct to sim params
simParams.flatsat = flatsat;
end

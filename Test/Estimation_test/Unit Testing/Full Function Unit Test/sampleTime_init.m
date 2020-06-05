%Author Kylle Ashton
% This files changes the time steps of everything in the sim to whatever you want

fswParams.sample_time_s = 1/50;
fswParams.estimation.dt = fswParams.sample_time_s ;
fswParams.estimation.sample_time_s = fswParams.sample_time_s ;
simParams.actuators.sample_time_s = fswParams.sample_time_s ;
simParams.sensors.gyro.sample_time_s = fswParams.sample_time_s ;
simParams.sensors.sun_sensor.sample_time_s = fswParams.sample_time_s ;
simParams.sample_time_s = fswParams.sample_time_s ;
simParams.sensors.mag.sample_time_s = fswParams.sample_time_s ;
simParams.sensors.sample_time_s = fswParams.sample_time_s ;
simParams.magField.sample_time_s = fswParams.sample_time_s ;
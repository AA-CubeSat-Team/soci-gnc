simParams.sample_time_s = .1;
tspan = 0:simParams.sample_time_s:10;
m = length(tspan);
set_param(bdroot,'ShowPortDataTypes','on')
set_param(bdroot,'ShowLineDimensions','on')

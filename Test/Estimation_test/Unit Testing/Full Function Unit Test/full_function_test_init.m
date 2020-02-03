simParams.sample_time_s = .1;
tspan = 0:simParams.sample_time_s:10;
m = length(tspan);
set_param(bdroot,'ShowPortDataTypes','on')
set_param(bdroot,'ShowLineDimensions','on')
valid1 = [tspan',ones(m,1)]; % gives health of sun sensor 1 == valid, 0 == invalid data
  valid2 = [tspan',ones(m,1)]; % gives health of mag sensor 1 == valid, 0 == invalid data
    valid3 = [tspan',ones(m,1)];
% simParams.initialConditions.w0 = zeros(3,1);
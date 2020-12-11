% test to check tuning and response of pd controller;
%
%
% Author: Cole Morgan

q0 = simParams.initialConditions.q_eci2body;

a = deg2rad(60);
n = randn(3,1);
n = n./norm(n);

q_err = [ cos(a/2); sin(a/2).*n ];

quat_cmd = quatmultiply( q0', quatconj(q_err') )';
quat_cmd = quat_cmd/norm(quat_cmd);

w_cmd_radps = zeros(3,1);

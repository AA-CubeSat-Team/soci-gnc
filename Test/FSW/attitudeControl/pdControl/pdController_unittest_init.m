% test to check tuning and response of pd controller;
%
%
% Author: Cole Morgan
clc;

quat_cmd = [-0.6157; 0.265; -0.265; -.6930];
quat_cmd = quat_cmd/norm(quat_cmd);
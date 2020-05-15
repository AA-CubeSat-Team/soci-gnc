% test to check tuning and response of pd controller;
%
%
% Author: Cole Morgan


% controller1 = struct;

q0 = [0.6157; 0.265; 0.265; -.6930]; % cannot be qd;
q0 = q0/norm(q0);     % initial orientation
simParams.initialConditions.q0 = q0;

qd = q0;

w0 = [0;0;0]; %rest to rest reorientation
simParams.initialConditions.w0 = w0;

% fswParams.controllers.controller1 = controller1;

% clear controller1 
% clear alpha A K w_max i q0 qd w0 m
% clearvars -except fswParams simParams TLE
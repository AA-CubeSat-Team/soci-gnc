% Initialization of the Slew rate and Control constrained controller unit
% test. Follows the design and methodology in "Feedback control logic for eigenaxis
% rotations under slew rate and control constraints"
%
%
% Author: Cole Morgan

clc;

% controller1 = struct;

q0 = [0.6157; 0.265; 0.265; -.6930]; % cannot be qd;
q0 = q0/norm(q0);     % initial orientation
simParams.initialConditions.q0 = q0;

qd = [-0.6157; 0.265; -0.265; -.6930];
qd = qd/norm(qd);

w0 = [0;0;0]; %rest to rest reorientation
simParams.initialConditions.w0 = w0;

% fswParams.controllers.controller1 = controller1;

% clear controller1 
% clear alpha A K w_max i q0 qd w0 m
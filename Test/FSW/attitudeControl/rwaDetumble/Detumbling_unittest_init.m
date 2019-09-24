% Initialization of the Detumbling controller unit test.
% Largely similar code to SlewAndControlConstrained.
% Here there is no slew constraint, but control is still constrained.
%
% Author: Cole Morgan


% controller2 = struct;

q0 = [0.6157; 0.265; 0.265; -.6930]; % cannot be qd;
q0 = q0/norm(q0);     % initial orientation
simParams.initialConditions.q0 = q0;

w0 = rand(3, 1);
w0 = (9*pi/180)*w0/norm(w0);
simParams.initialConditions.w0 = w0;

% fswParams.controllers.controller2 = controller2;

clear controller2 
clear alpha A K w_max i q0 qd w0 m
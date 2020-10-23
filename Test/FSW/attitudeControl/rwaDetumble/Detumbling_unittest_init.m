% Initialization of the Detumbling controller unit test.
% Largely similar code to SlewAndControlConstrained.
% Here there is no slew constraint, but control is still constrained.
%
% Author: Cole Morgan

% Set initial conditions for the sim
q0 = [0.6157; 0.265; 0.265; -.6930]; % cannot be qd;
q0 = q0/norm(q0);     % initial orientation
simParams.initialConditions.q_eci2body = q0;

w0 = rand(3, 1);
w0 = (20*pi/180)*w0/norm(w0);
simParams.initialConditions.w_body_radps = w0;

% fswParams.controllers.asm.C = 100 * fswParams.controllers.asm.C;
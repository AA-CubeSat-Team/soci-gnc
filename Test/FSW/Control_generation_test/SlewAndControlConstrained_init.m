% Initialization of the Slew rate and Control constrained controller
% Follows the design and methodology in "Feedback control logic for eigenaxis
% rotations under slew rate and control constraints"
%
%
% Author: Cole Morgan


controllers = struct;
controllers.J = simParams.scParams.J;

alpha = 45; % angle of the reaction wheels
A = [cosd(alpha) 0 -cosd(alpha) 0;
    0 -cosd(alpha) 0 cosd(alpha);
    sind(alpha) sind(alpha) sind(alpha) sind(alpha)];
controllers.A = A;
A = A'*inv(A*A'); % psuedo inverse
controllers.Phi = A;

w_max = .6; %deg/sec max slew rate we chose arbitraily to
           % reorient quickly but not induce detumble mode
           % detumble mode enters at 9 deg/s about any axis
w_max = w_max*pi/180; % max slew rate in rad/sec
controllers.w_max = w_max;
controllers.torque_max = .7*3.2*10^-3; %N-m 70% max for any given wheel in our RWA 
m = controllers.torque_max;
controllers.T = diag([1/m, 1/m, 1/m, 1/m]);

controllers.zeta = sqrt(2)/2;   % damping ratio
controllers.wn = .5;            % natural frequency

q0 = [0.6157; 0.265; 0.265; -.6930]; % cannot be qd;
q0 = q0/norm(q0);     % initial orientation
controllers.q0 = q0;

qd = [1;0;0;0];
qd = qd/norm(qd);     % desired quaternion. scalar first.
controllers.qd = qd;

controllers.ep = .001; % use this to determine if K needs to be changed
controllers.K_init = eye(3); %will inevitably change in sim
controllers.C = 2*controllers.zeta*controllers.wn*controllers.J;

controllers.saturation = 1; %saturate the value of Pq to +-1
                            %higher values will allow higher body rates

controllers.w0 = [0;0;0]; % initial body rates for rest-to-rest reorientation
% w0 = rand(3, 1);
% controllers.w0 = (9*pi/180)*w0/norm(w0);
controllers.qd1 =[1;0;0;0];

fswParams.controllers = controllers;

clear controllers 
clear alpha A K w_max i q0 qd w0 m
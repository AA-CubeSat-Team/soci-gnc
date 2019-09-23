% Initialization of the Slew rate and Control constrained controller
% Follows the design and methodology in "Feedback control logic for eigenaxis
% rotations under slew rate and control constraints"
%
%
% Author: Cole Morgan


% controllers = struct;
controller2 = struct;
controller2.J = simParams.scParams.J;

alpha = 45; % angle of the reaction wheels
A = [cosd(alpha) 0 -cosd(alpha) 0;
    0 -cosd(alpha) 0 cosd(alpha);
    sind(alpha) sind(alpha) sind(alpha) sind(alpha)];
controller2.A = A;
A = A'*inv(A*A'); % psuedo inverse
controller2.Phi = A;

w_max = 6; %deg/sec max slew rate we chose arbitraily to
           % reorient quickly but not induce detumble mode
           % detumble mode enters at 9 deg/s about any axis
w_max = w_max*pi/180; % max slew rate in rad/sec
controller2.w_max = w_max;
controller2.torque_max = .7*3.2*10^-3; %N-m 70% max for any given wheel in our RWA 
m = controller2.torque_max;
controller2.T = diag([1/m, 1/m, 1/m, 1/m]);

controller2.zeta = sqrt(2)/2;   % damping ratio
controller2.wn = .5;            % natural frequency

q0 = [0.6157; 0.265; 0.265; -.6930]; % cannot be qd;
q0 = q0/norm(q0);     % initial orientation
controller2.q0 = q0;

qd = [1;0;0;0];
qd = qd/norm(qd);     % desired quaternion. scalar first.
controller2.qd = qd;

controller2.ep = .001; % use this to determine if K needs to be changed
controller2.K_init = eye(3); %will inevitably change in sim
controller2.C = 2*controller2.zeta*controller2.wn*controller2.J;

controller2.saturation = 1; %saturate the value of Pq to +-1
                            %higher values will allow higher body rates

controller2.w0 = [0;0;0]; % initial body rates for rest-to-rest reorientation
% w0 = rand(3, 1);
% controllers.w0 = (9*pi/180)*w0/norm(w0);
controller2.qd1 =[1;0;0;0];

fswParams.controllers.controller2 = controller2;

clear controller2 
clear alpha A K w_max i q0 qd w0 m
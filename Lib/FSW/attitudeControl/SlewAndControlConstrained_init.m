% Initialization of the Slew rate and Control constrained controller
% Follows the design and methodology in "Feedback control logic for eigenaxis
% rotations under slew rate and control constraints"
%
%
% Author: Cole Morgan


% controllers = struct;
controller1 = struct;
controller1.J = simParams.scParams.J;

alpha = 45; % angle of the reaction wheels
A = [cosd(alpha) 0 -cosd(alpha) 0;
    0 -cosd(alpha) 0 cosd(alpha);
    sind(alpha) sind(alpha) sind(alpha) sind(alpha)];
controller1.A = A;
A = A'*inv(A*A'); % psuedo inverse
controller1.Phi = A;

w_max = 6; %deg/sec max slew rate we chose arbitraily to
           % reorient quickly but not induce detumble mode
           % detumble mode enters at 9 deg/s about any axis
w_max = w_max*pi/180; % max slew rate in rad/sec
controller1.w_max = w_max;
controller1.torque_max = .7*3.2*10^-3; %N-m 70% max for any given wheel in our RWA 
m = controller1.torque_max;
controller1.T = diag([1/m, 1/m, 1/m, 1/m]);

controller1.zeta = sqrt(2)/2;   % damping ratio
controller1.wn = .5;            % natural frequency

qd = [1;0;0;0];
qd = qd/norm(qd);     % desired quaternion. scalar first.
controller1.qd = qd;

controller1.ep = .001; % use this to determine if K needs to be changed
controller1.K_init = eye(3); %will inevitably change in sim
controller1.C = 2*controller1.zeta*controller1.wn*controller1.J;

controller1.saturation = 1; %saturate the value of Pq to +-1
                            %higher values will allow higher body rates

fswParams.controllers.controller1 = controller1;

clear controller1 
clear alpha A K w_max i qd m
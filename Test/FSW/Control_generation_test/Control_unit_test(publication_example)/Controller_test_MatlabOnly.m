%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%
% Author: Cole Morgan
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% generates a control signal u that stablizes a spacecraft under
% slew rate and control constraints. The simulation shows rest-to-rest
% sc reorientaiton from a "random" intial attitude. The code here
% replicates the example in the "Feedback control logic for eigenaxis
% rotations under slew rate and control constraints". 

% Note that the quaternion here is scalar last




% clear all; close all; clc;

addpath('shared/')
addpath('Q_lib/')
addpath('functions')

global P;
P = struct;
P.inertia = [6292 0 0; 0 5477 0; 0 0 2687];
% P.control_input = [0; 0; 0];
% P.control_torque = [0;0;0;0];

alpha = 45;
A = [cosd(alpha) -cosd(alpha) cosd(alpha) -cosd(alpha);
    sind(alpha) 0 -sind(alpha) 0;
    0 -sind(alpha) 0 sind(alpha)];

A = A'*inv(A*A');
P.A = A;


w_max = .2; %deg/sec
w_max = w_max*pi/180; % max slew rate in rad/sec
P.zeta = sqrt(2)/2;   % damping ratio
P.wn = .1;            % natural frequency

qd = [0;0;0;1];
qd = qd/norm(qd);     % desired quaternion
P.qd = qd;


q0 = [0.265; 0.265; -.6930; 0.6157];
q0 = q0/norm(q0);     % initial orientation
K = zeros(3, 3);
for i = 1:3
    K(i, i) = 2*P.zeta*P.wn*(abs(q0(i))/norm(q0(1:3)))*w_max*P.inertia(i, i);
end

P.K = K;
P.P = (2*(P.wn^2))*(K\P.inertia);
P.C = 2*P.zeta*P.wn*P.inertia;

w0 = [0; 0; 0]; % initial body rates for rest-to-rest reorientation

x0 = [q0 ; w0];

% [t, x] = ode45(@(t, x) dynamics(x, qd, P), [0 1800], x0);
[t, x] = ode45(@dynamics, [0 1800], x0);
% [dx, control_input, control_torue] = dynamics(t, x.');
% P.control_input = [P.control_input control_input];
% P.control_torque = [P.control_torque control_torque];

plot(t, x(:, 1:4));
legend('q1', 'q2', 'q3', 'q4 scalar')
title('quaternion vs time')

figure()
plot(t, x(:, 5:7));
legend('\omega_1', '\omega_2', '\omega_3')
title('angular rates vs time')

slew_rate = zeros(length(t), 1);
for i = 1:length(t)
    slew_rate(i, 1) = sqrt(x(i, 5)^2 + x(i, 6)^2 + x(i, 7)^2);
end
slew_rate = 180*slew_rate/pi;

figure()
plot(t, slew_rate);
legend('slew rate')
title('slew rate')


q_err = zeros(length(t), 4);
for i = 1:length(t)
    q_err(i, :) = Q_mult(Q_conj(qd), x(i, 1:4));
end

figure()
plot(t, q_err)
title('error quaternion vs time')
legend('q1_{err}', 'q2_{err}', 'q3_{err}', 'q4_{err} scalar')


% figure()
% plot(t, P.control_input(:, 2:end))
% title('control input u')
% legend()
% 
% figure()
% plot(t, P.control_torque(:, 2:end))
% title('control torques')
% legend()

function [dx, uu, tau] = dynamics(t, x)

global P;
q   = x(1:4, :);
q   = q./norm(q);
w   = x(5:7, :);
uu = 0;
h = 0;


qe = Q_mult(Q_conj(P.qd), q);

C = P.C;
K = P.K;


% basic controller % 
% uu = -K*qe(1:3) - C*w + skew(w)*(P.inertia*w+h);

% slew rate and control constrained %
uu = -saturation_norm(K*saturation_1(P.P*qe(1:3)) + C*w);

tau = P.A*uu; % control outputs to each motor minimized 
              % based on psuedo-inverse of their mapping


% P.control_input = [P.control_input uu];
% P.control_torque = [P.control_torque tau];


dq  = 0.5*Q_mult(q,[w;0]);
% Dynamics
dw  = P.inertia\(uu - skew(w)*(P.inertia*w+h));

% Output
dx  = [ dq; dw];


end

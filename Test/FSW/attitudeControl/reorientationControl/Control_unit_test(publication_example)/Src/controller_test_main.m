clear all; close all; clc;

addpath('shared/')
addpath('Q_lib/')
addpath('Lib')


P = struct;
P.inertia = [6292 0 0; 0 5477 0; 0 0 2687];
P.control_input = [0; 0; 0];
P.control_torque = [0;0;0;0];

alpha = 45;
A = [cosd(alpha) -cosd(alpha) cosd(alpha) -cosd(alpha);
    sind(alpha) 0 -sind(alpha) 0;
    0 -sind(alpha) 0 sind(alpha)];

A = A'*inv(A*A');
P.A = A;


w_max = .2; %deg/sec
w_max = w_max*pi/180;
P.zeta = sqrt(2)/2;
P.wn = .1;

qd = [1;0;0;0];
qd = qd/norm(qd);
P.qd = qd;


q0 = [0.6157; 0.265; 0.265; -.6930];
q0 = q0/norm(q0);
K = zeros(3, 3);
for i = 1:3
    K(i, i) = 2*P.zeta*P.wn*(abs(q0(i+1))/norm(q0(2:4)))*w_max*P.inertia(i, i);
end

P.K = K;
P.P = (2*(P.wn^2))*(K\P.inertia);
P.C = 2*P.zeta*P.wn*P.inertia;

w0 = [0; 0; 0];

x0 = [q0 ; w0];

%sim('control_test.slx');
% AA528 
%
% Homework 9 - Design
clear variables; close all

% load constants
addpath('Q_lib/')
constants

% Inertias
J = [ 8853 -161  114;
     -161   8171 161;
      114   161  4651 ];
Jw = 0.16;

% Disturbance
tau_d = 15 * 1e-6; % (magnitude) Nm
n   = randn(3,1);  % pick random direction for the disturbance;
n   = n./norm(n);  % make sure the direction is a unit vector.

% Choose a damping ratio and natural frequency
zeta = 1;
wn   = 0.37;
kp  = wn^2;
kd  = 2 * wn * zeta;

P.tau_d = tau_d .* n;
P.J  = J;
P.Jw = Jw;
P.Kp = kp * J;
P.Kd = kd * J;
P.q_cmd = [ 0.5; 0.5; 0.5; 0.5 ];

n   = [1;0;1]./norm([1;0;1]);
ang = 10 * DEG2RAD;
q0  = [ 0.3635; -0.4790; 0.5484; 0.5811 ];
w0  = [ 0.0071; -0.0011; 0.0331 ];
h0  = zeros(3,1);

[T,X] = ode45(@(t,x)sim_cassini(t,x,P),[0 60],[q0;w0;h0]);

figure, hold on, grid on, box on
plot(T,X(:,1:4),'LineWidth',1.5)
legend('q_1','q_2','q_3','q_4')
set(gca,'Ylim',[-1.2,1.2])
xlabel('Time [s]')
ylabel('Attitude Quaternion')

figure, hold on, grid on, box on
plot(T,X(:,5:7),'LineWidth',1.5)
legend('\omega_1','\omega_2','\omega_3')
xlabel('Time [s]')
ylabel('Angular Velocity [rad/s]')

figure, hold on, grid on, box on
plot(T,X(:,8:10)./P.Jw,'LineWidth',1.5)
legend('\Omega_1','\Omega_2','\Omega_3')
xlabel('Time [s]')
ylabel('Wheel Speeds [RPM]')

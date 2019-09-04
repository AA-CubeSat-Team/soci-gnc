% AA528 
%
% Homework 8
clear variables; close all

% load constants
addpath('Q_lib/')
constants

% Inertias
J = [ 8853 -161  114;
     -161   8171 161;
      114   161  4651 ];
% Simply choose the diagonal entries to do the control design
Jd = diag(J); 
Jw = 0.16;

% Disturbance
tau_d = 15 * 1e-6; % (magnitude) Nm
n   = randn(3,1);  % pick random direction for the disturbance;
n   = n./norm(n);  % make sure the direction is a unit vector.

% Plant model -- change axis = (1,2,3} to study a different axis at a time.
axis = 3;
s = tf('s');
Gp = 1/(Jd(axis)*s^2);

% Choose a damping ratio and natural frequency
zeta = 0.4;
wn   = 0.37;

% build controller
Kp = wn^2 * Jd(axis);
Kd = 2*zeta*wn * Jd(axis);
Gc = Kp + Kd*s;

% open & closed loop transfer functions
Go = Gp * Gc;
T   = minreal(Go/(1+Go));

% Bode plot with the important frequencies labeled
% Bw = 1/((1 + .7*s + s^2)*(.3*s^2 + s + 1));
Bw = 1/(-s^4+s+1);
figure
bode(Go*Bw,{1e-3,1e3}), hold on, grid on, box on
plot([0.65 0.65],get(gca,'Ylim'),'--')
plot([0.2 0.2],get(gca,'Ylim'),'--')

% Step response of the closed loop system
figure
step(T)

% Step response to a (constant) disturance
figure
Gd = minreal(Gp/(1+Go));
step(Gd);

% Simulate the resulting controller with the nonlinear system. 
% Each of the following gain matrix entries were generated using the steps
% above and then filled in manually!
P.tau_d = tau_d .* n;
P.J  = J;
P.Jw = Jw;
P.Kp = diag([1212,1118.6,636.72]); 
P.Kd = diag([2620.5,2418.6,1376.7]);
P.q_cmd = [ 0.0; 0.0; 0.0; 1.0 ];

n   = [1;0;1]./norm([1;0;1]);
ang = 10 * DEG2RAD;
q0  = [ sin(ang/2).*n; cos(ang/2) ];
w0  = zeros(3,1);
h0  = zeros(3,1);

[T,X] = ode45(@(t,x)sim_cassini(t,x,P),[0 60],[q0;w0;h0]);

figure, hold on, grid on, box on
plot(T,X(:,1:4),'LineWidth',1.5)
legend('q_1','q_2','q_3','q_4')
set(gca,'Ylim',[-0.2,1.2])
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

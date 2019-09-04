% AA528 HW7
%
% Design Problem
clear variables; close all

% load constants
addpath('Q_lib/')
constants

% spacecraft parameters
Jx  = 0.1;
Jy  = 0.1;
Jz  = 0.03;
r   = 600e3 + rE;
n   = sqrt(muE/r^3);

% control objectives
tau_d = 1e-5; % disturbance torque [Nm]
e_ss = 0.1 * DEG2RAD;   % steady-state error
ts   = 20;              % settling time [s]

% plant transfer function
s  = tf('s');

% proportional gain (from steady-state analysis) for part (d)
kp_min  = (tau_d/e_ss - 3*n^2*(Jx-Jz)/Jy^2);
kp  = 0.01;% approx 2*kp_min -- build in some margin!
wn  = sqrt(kp/Jy);

% derivative gain (from transient response) for part (e)
zeta = 4.4/(ts*wn);
kd   = 2*zeta*wn*Jy;

% transfer functions
Gp = 1/(Jy*s*s + kd*s + 3*n^2*(Jx-Jz));
Gc = kp;
Go = minreal(Gp*Gc); % open loop transfer function

% step response for part (f)
R2E = minreal(1/(1+Go)); 
R2O = minreal(Go/(1+Go));
D2E = minreal(-Gp/(1+Go));

figure
step(R2O);
grid on

% simulate linear system for part (g)
P.n  = n;
P.Jx = Jx;
P.Jy = Jy;
P.Jz = Jz;
P.kp = kp;
P.kd = kd;
P.theta_cmd = 0.0 * DEG2RAD;
P.tau_d = tau_d;
x0  = [ 5; -0.1 ] .* DEG2RAD;

[T,X] = ode45(@(t,x)pitch_gg_linear(t,x,P),[0 60],x0);

% plot the results
figure
subplot(2,1,1), hold on, grid on
plot(T,X(:,1).*RAD2DEG);
plot(get(gca,'xlim'),[e_ss e_ss]*RAD2DEG,'r--')
plot(get(gca,'xlim'),-[e_ss e_ss]*RAD2DEG,'r--')
xlabel('Time [s]')
ylabel('Pitch Angle [deg]')
subplot(2,1,2), hold on, grid on
plot(T,X(:,2).*RAD2DEG);
xlabel('Time [s]')
ylabel('Pitch Rate [deg/s]')

figure, hold on, grid on
plot(T,X(:,1).*RAD2DEG);
plot(get(gca,'xlim'),[e_ss e_ss]*RAD2DEG,'r--')
plot(get(gca,'xlim'),-[e_ss e_ss]*RAD2DEG,'r--')
xlim([20 60])
ylim([-1.5*e_ss*RAD2DEG 1.5*e_ss*RAD2DEG])
xlabel('Time [s]')
ylabel('Pitch Angle [deg]')





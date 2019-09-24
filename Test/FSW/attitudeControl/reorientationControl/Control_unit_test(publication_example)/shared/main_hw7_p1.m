% AA528 HW7
%
% Problem 1
clear variables; close all

% load constants
addpath('Q_lib/')
constants

% Spacecraft parameters
sc = struct;
sc.J = diag([1000,500,700]);

% Controller parameters
wn    = 1.0;
zeta  = 1.0;
sc.Kp = wn^2 .* sc.J;
sc.Kd = 2*zeta*wn .* sc.J;

% Commanded reference values
roll_cmd   = -60 * DEG2RAD;
pitch_cmd  = -40 * DEG2RAD;
yaw_cmd    = 40 * DEG2RAD;

sc.eul_cmd = [ roll_cmd; pitch_cmd; yaw_cmd ];
C_cmd      = rotm(roll_cmd,'x') * rotm(pitch_cmd,'y') * rotm(yaw_cmd,'z');
sc.q_cmd   = my_dcm2quat_last(C_cmd);

% Integrate Euler angle case
sc.att_type = 'euler_angle';
x0      = zeros(6,1);
tspan   = [0 30];
[T1,X1] = ode45(@(t,x)attitude_dynamics(t,x,sc),tspan,x0);

% Integrate Quaternion case
sc.att_type = 'quaternion';
x0      = [ 0.0; 0.0; 0.0; 1.0; zeros(3,1) ];
tspan   = [0 30];
[T2,X2] = ode45(@(t,x)attitude_dynamics(t,x,sc),tspan,x0);

RPY = zeros(length(T2),3);
for k = 1:length(T2)
    qk = X2(k,1:4);
    qk = [ qk(4); qk(1:3)' ]'; % flip to Matlab's scalar-first row format
    [y,p,r] = quat2angle( qk ); % 3-2-1 is the default
    RPY(k,1) = r * RAD2DEG;
    RPY(k,2) = p * RAD2DEG;
    RPY(k,3) = y * RAD2DEG;
end

%% Plot results

figure(1), hold on, grid on
plot(T1,X1(:,1).*RAD2DEG,'b')
plot(T1,X1(:,2).*RAD2DEG,'r')
plot(T1,X1(:,3).*RAD2DEG,'k')
plot([0 T1(end)],[roll_cmd roll_cmd].*RAD2DEG,'b--')
plot([0 T1(end)],[pitch_cmd pitch_cmd].*RAD2DEG,'r--')
plot([0 T1(end)],[yaw_cmd yaw_cmd].*RAD2DEG,'k--')
legend('\phi','\theta','\psi')
xlabel('Time [s]')
ylabel('Euler Angles [deg]')
title('Euler Angle Case')

figure(2), hold on, grid on
plot(T2,RPY(:,1),'b')
plot(T2,RPY(:,2),'r')
plot(T2,RPY(:,3),'k')
plot([0 T2(end)],[roll_cmd roll_cmd].*RAD2DEG,'b--')
plot([0 T2(end)],[pitch_cmd pitch_cmd].*RAD2DEG,'r--')
plot([0 T2(end)],[yaw_cmd yaw_cmd].*RAD2DEG,'k--')
legend('\phi','\theta','\psi')
xlabel('Time [s]')
ylabel('Euler Angles [deg]')
title('Quaternion Case')

% AA528 HW5
%
% Problem design
clear variables; close all

% load constants
addpath('Q_lib/')
constants

sc = struct;

tspan = [0 10];

% s/c inertia
sc.J = [ 200 0.0 0.0;
         0.0 50 0.0;
         0.0 0.0 100 ];

% equilibrium
sc.nu = 0.5;
lambda_x = sc.nu*(sc.J(3,3)-sc.J(2,2))/sc.J(1,1);
lambda_y = sc.nu*(sc.J(1,1)-sc.J(3,3))/sc.J(2,2);

% perturbed intial condition
w0 = [ 0.01; 0.02; sc.nu+0.01 ];

% control gains
sc.ks = 2;
sc.k = 2*sqrt(lambda_x * lambda_y);

% simulate the motion without control
sc.control = false;
[T_nc,w_nc] = ode45(@(t,x)euler_ode(t,x,sc),tspan,w0);

% simulate the controlled motion
sc.control = true;
[T_c,w_c] = ode45(@(t,x)euler_ode(t,x,sc),tspan,w0);

figure, hold on, grid on
plot(T_nc,w_nc)
legend('\omega_x','\omega_y','\omega_z')
xlabel('Time [s]')
ylabel('Angular Velocity [rad/s]')
title('Uncontrolled Motion')

figure, hold on, grid on
plot(T_c,w_c)
legend('\omega_x','\omega_y','\omega_z')
xlabel('Time [s]')
ylabel('Angular Velocity [rad/s]')
title('Controlled Motion')


% AA528 
%
% Homework 9 - Problem 4
clear variables; close all

% load constants
addpath('Q_lib/')
constants

J = [ 1200  100  -200; 
       100 2200   300; 
      -200  300  3100 ];

q0 = [ 0.57; 0.57; 0.57; 0.159 ];
w0 = [ 0.01; 0.01; 0.01 ];
x0 = [ q0; w0 ];

P = struct;
P.ctrl    = 'hw9_p4_ctrl';
P.inertia = J;
P.mu      = 1;

% Build controller for problem 4
alpha  = 0.32;
beta   = 0.0512;
P.Kd   = alpha * J;
P.Kp   = beta * J;
% simulate problem 4 controller
[T1,X1] = ode45(@(t,x)Q_ode(P,t,x,P.ctrl),[0 100],x0);

% Build controller for comparison
kd     = alpha;
P.Kd   = kd * J;
P.Kp   = diag([72,110,204]);
% simulate
[T2,X2] = ode45(@(t,x)Q_ode(P,t,x,P.ctrl),[0 100],x0);

% Plot results
figure(1)
subplot(1,3,1), hold on, grid on, box on
plot(X1(:,1),X1(:,2))
plot(X2(:,1),X2(:,2))
xlabel('$q_1$')
ylabel('$q_2$')
subplot(1,3,2), hold on, grid on, box on
plot(X1(:,2),X1(:,3))
plot(X2(:,2),X2(:,3))
xlabel('$q_2$')
ylabel('$q_3$')
subplot(1,3,3), hold on, grid on, box on
plot(X1(:,3),X1(:,1))
plot(X2(:,3),X2(:,1))
xlabel('$q_3$')
ylabel('$q_1$')
legend('Case 1','Case 2')
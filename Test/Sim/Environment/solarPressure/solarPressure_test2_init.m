% TEST FOR FULL ORBIT SIM
clc; close all

% SIMULINK PARAMETERS
utc_test = 137803367;
r = [3829.45; -888.41; 5459.13] ;
v = [0;0;0];
q = q0;
w = [0;0;0];

state = [r;v;q;w];

% SIM THE FIRST ITERATION
sim('solarPressure_test.slx')

solarTorque = solarTorque.Data
EclipseCheck = ECLIPSE.data
sunVec = e2s_inertial_unit.Data * 149598073


% SIMULATE THE ORBIT AND PLOT RELATIVE TO SUN
rs = [3829.45, -888.41, 5459.13] ;
vs = [2.5396, 7.2434, -0.6063];

re =  6378.137;

options = odeset('RelTol',1e-4,'AbsTol',1e-4);
X0 = [rs vs]

[t,y]=ode45(@orbit,[0 100000],X0,options);

figure()
[X,Y,Z] = sphere(100);
surf(X*re, Y*re, Z*re, 'EdgeColor', 'none','FaceAlpha', .4,'FaceColor','b')
axis equal;
hold all
plot3(y(:,1),y(:,2),y(:,3),'k','LineWidth',2)
plot3(y(1,1),y(1,2),y(1,3),'g*','MarkerSize',10,'LineWidth',2)
plot3(y(300,1),y(300,2),y(300,3),'r*','MarkerSize',10,'LineWidth',2)
plot3(y(310,1),y(315,2),y(315,3),'m*','MarkerSize',10,'LineWidth',2)
% I rescaled the sun vector so we can see both earth and sun 
plot3(sunVec(1)/10000,sunVec(2)/10000,sunVec(3)/10000,'*','color',[0.9290, 0.6940, 0.1250],'MarkerSize',20,'LineWidth',2)
% view(3)
legend('Earth','Orbit','Initial S/C Position (SP present)','In Eclipse 1 (No SP)','Edge Case (SP present)','Sun')
title('Sim result for Eclipse Check/Solar Pressure')
xlabel('Distance [km] (not to scale for sun)')


% SIM A NEGATIVE RESULT
utc_test = 137803367;
r = [y(300,1);y(300,2);y(300,3)] ;
v = [0;0;0];
q = q0;
w = [0;0;0];

state = [r;v;q;w];

% RUN SIM
sim('solarPressure_test.slx')

solarTorque = solarTorque.Data
EclipseCheck = ECLIPSE.data
% sunVec = e2s_inertial_unit.Data * 149598073

% SIM  Edge Case
utc_test = 137803367;
r = [y(315,1);y(315,2);y(315,3)] ;
v = [0;0;0];
q = q0;
w = [0;0;0];

state = [r;v;q;w];

% RUN SIM
sim('solarPressure_test.slx')

solarTorque = solarTorque.Data
EclipseCheck = ECLIPSE.data
% sunVec = e2s_inertial_unit.Data * 149598073



function dX = orbit(t,X)
    mu = 398574.405;
    rx = X(1);
    ry = X(2);
    rz = X(3);
    vx = X(4);
    vy = X(5);
    vz = X(6);
    r  = sqrt(rx.^2+ry.^2+rz.^2);
    dX=zeros(6,1);
    dX(1) = vx;
    dX(2) =vy;
    dX(3) = vz;
    dX(4) = -mu*rx/r.^3;
    dX(5) = -mu*ry/r.^3;
    dX(6) = -mu*rz/r.^3;
end
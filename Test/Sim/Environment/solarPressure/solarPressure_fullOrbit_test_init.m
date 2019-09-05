 
% TEST FOR FULL ORBIT SIM
clc; close all

% SIMULINK PARAMETERS
utc_test = 137803367;
r = [3829.45; -888.41; 5459.13] ;
v = [0;0;0];
q = q0;
w = [0;0;0];

state = [r;v;q;w];
% Yes or No Solar Pressure
red = 'r*';
green = 'g*';


%  SIMULATE THE ORBIT AND PLOT RELATIVE TO SUN
rs = [3829.45, -888.41, 5459.13] ;
vs = [2.5396, 7.2434, -0.6063];

re =  6378.137;

options = odeset('RelTol',1e-4,'AbsTol',1e-4);
X0 = [rs vs];

[t,y]=ode45(@orbit,[0 5500],X0,options);

% Sim Constants
v = [0;0;0];
q = q0;
w = [0;0;0];
utc_test = 137803367;

figure()
subplot(1,2,1)
[X,Y,Z] = sphere(100);
surf(X*re, Y*re, Z*re, 'EdgeColor', 'none','FaceAlpha', .4,'FaceColor','b')
axis equal;
hold all
plot3(y(:,1),y(:,2),y(:,3),'k','LineWidth',2)
plot3(sunVec(1)/10000,sunVec(2)/10000,sunVec(3)/10000,'*','color',[0.9290, 0.6940, 0.1250],'MarkerSize',20,'LineWidth',2)

resultPressure_Nms = [];

for k = 1:1:length(t)
%     Set sim Params
% SIM A NEGATIVE RESULT
r = [y(k,1);y(k,2);y(k,3)] ;
state = [r;v;q;w];

% RUN SIM
sim('solarPressure_test.slx')

solarTorque = solarTorque.Data;
EclipseCheck = ECLIPSE.Data;

resultPressure_Nms(:,k) = solarTorque.';

if EclipseCheck   
plot3(y(k,1),y(k,2),y(k,3),red,'MarkerSize',8,'LineWidth',2)
    if k == 1
        plot3(y(k,1),y(k,2),y(k,3),'m*','MarkerSize',15,'LineWidth',2)
    end
else
    plot3(y(k,1),y(k,2),y(k,3),green,'MarkerSize',10,'LineWidth',2)
    if k == 1
        plot3(y(k,1),y(k,2),y(k,3),'m*','MarkerSize',15,'LineWidth',2)
    end
end    
    
end

% I rescaled the sun vector so we can see both earth and sun 
% view(3)
legend('Earth','Orbit','Sun','Green (SP Present) Red (No SP)','Initial S/C Position (SP present)')
title('Sim result for Eclipse Check/Solar Pressure')
xlabel('Distance [km] (not to scale for sun)')

k = 1:1:length(t);
subplot(1,2,2)
hold all;
plot(resultPressure_Nms(1,2:end),'*')
plot(resultPressure_Nms(2,:),'o')
plot(resultPressure_Nms(3,:),'sq')
legend('P_x','P_y','P_z')
xlabel('Position (Going Around Clockwise)')
ylabel('Solar Torque [Nms]')















% Keplerian Orbit
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
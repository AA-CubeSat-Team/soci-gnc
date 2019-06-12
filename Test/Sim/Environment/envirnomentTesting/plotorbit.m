% FULL ORBIT PLOT
% This scrip can be run in the command window to plot tbe orbit after a sim
% Author: Devan Tormey

clc;

re =  6378.137; %Radius of earth, km


figure()
% Plot Earth reference
[X,Y,Z] = sphere(100);
surf(X*re, Y*re, Z*re, 'EdgeColor', 'none','FaceAlpha', .4,'FaceColor','b')
axis equal;
hold all
% Plot the orbit as a plot3
plot3(r_eci_km.Data(:,1),r_eci_km.Data(:,2),r_eci_km.Data(:,3),'r','LineWidth',1)


% Plot the radii on their own
figure()
hold all
plot(tout,r_eci_km.Data(:,1),'LineWidth',2)
plot(tout,r_eci_km.Data(:,2),'LineWidth',2)
plot(tout,r_eci_km.Data(:,3),'LineWidth',2)
r = norm(simParams.initialConditions.r0);
% Include reference line for 500 km orbit
plot([tout(1),tout(end)],[r r],'--','LineWidth',2)

% Find Peaks
k = 566120;
[pksx(1), indx(1)] = max(r_eci_km.Data(1:k,1));
[pksy(1), indy(1)] = max(r_eci_km.Data(1:k,2));
[pksx(2), indx(2)] = max(r_eci_km.Data(k:end,1));
[pksy(2), indy(2)] = max(r_eci_km.Data(k:end,2));

plot(tout( indx(1) ), pksx(1),'*')
plot(tout( indx(2) + k), pksx(2),'*')

plot(tout( indy(1) ), pksy(1),'o')

plot(tout( indy(2) + k), pksy(2),'sq')

title('Orbital Radius')
legend('r_x','r_y','r_z')

% Try and plot growth in r if orbit is long enough
figure()
subplot(2,1,1)
plot(pksx - r,'*');
title('Growth in r_x')
xlabel('orbit')
ylabel('r_x - norm(r) [km]')
subplot(2,1,2)
plot(pksy - r,'*');
title('Growth in r_y')
ylabel('r_y - norm(r) [km]')






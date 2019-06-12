% Author: Devan Tormey
% TITLE: Environment Verification test
close all

% sim('Main_Sim.slx')


re =  6378.137;

% Turning off and on 
SP_ON = 0;
GG_ON = 0;
ATMO_ON = 0;

%% 
close all; clc;

figure()
[X,Y,Z] = sphere(100);
surf(X*re, Y*re, Z*re, 'EdgeColor', 'none','FaceAlpha', .4,'FaceColor','b')
axis equal;
hold all
plot3(r_eci_km.Data(:,1),r_eci_km.Data(:,2),r_eci_km.Data(:,3),'r','LineWidth',1)

figure()
hold all
plot(tout,r_eci_km.Data(:,1),'LineWidth',2)
plot(tout,r_eci_km.Data(:,2),'LineWidth',2)
plot(tout,r_eci_km.Data(:,3),'LineWidth',2)
r = norm(simParams.initialConditions.r0);
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

% figure()
% hold all
% plot(tout,v_eci_kms.Data(:,1),'LineWidth',2)
% plot(tout,v_eci_kms.Data(:,2),'LineWidth',2)
% plot(tout,v_eci_kms.Data(:,3),'LineWidth',2)
% title('Orbital Velocity')
% 
% figure()
% hold all
% plot(obit_data.Data(:,1),'LineWidth',2)
% plot(obit_data.Data(:,2),'LineWidth',2)
% plot(obit_data.Data(:,3),'LineWidth',2)
% title('Orbital Acceleration')
% 
% 
% 
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






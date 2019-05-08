% Author: Devan Tormey
% TITLE: Environment Verification test
close all
sim('Main_Sim.slx')


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
title('Orbital Radius')

rxmax = max(r_eci_km.Data(:,1))
growthx = r - rxmax

rymax = max(r_eci_km.Data(:,2))
growthy = r - rymax

figure()
hold all
plot(tout,v_eci_kms.Data(:,1),'LineWidth',2)
plot(tout,v_eci_kms.Data(:,2),'LineWidth',2)
plot(tout,v_eci_kms.Data(:,3),'LineWidth',2)
title('Orbital Velocity')

figure()
hold all
plot(obit_data.Data(:,1),'LineWidth',2)
plot(obit_data.Data(:,2),'LineWidth',2)
plot(obit_data.Data(:,3),'LineWidth',2)
title('Orbital Acceleration')






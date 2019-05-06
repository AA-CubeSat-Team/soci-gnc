% Author: Devan Tormey
% TITLE: Environment Verification test
close all
sim('Main_Sim.slx')


re =  6378.137;

% Turning off and on 
SP_ON = 0;
GG_ON = 0;
ATMO_ON = 0;

figure()
[X,Y,Z] = sphere(100);
surf(X*re, Y*re, Z*re, 'EdgeColor', 'none','FaceAlpha', .4,'FaceColor','b')
axis equal;
hold all
plot3(r_eci_km.Data(:,1),r_eci_km.Data(:,2),r_eci_km.Data(:,3),'r','LineWidth',3)

figure()
hold all
plot(v_eci_kms.Data(:,1),'LineWidth',3)
plot(v_eci_kms.Data(:,2),'LineWidth',3)
plot(v_eci_kms.Data(:,3),'LineWidth',3)

figure()
hold all
plot(obit_data.Data(:,1),'LineWidth',3)
plot(obit_data.Data(:,2),'LineWidth',3)
plot(obit_data.Data(:,3),'LineWidth',3)






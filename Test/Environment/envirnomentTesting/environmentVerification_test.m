% Author: Devan Tormey
% TITLE: Environment Verification test
close all
sim('Main_Sim.slx')
clc

re =  6378.137;

figure()
[X,Y,Z] = sphere(100);
surf(X*re, Y*re, Z*re, 'EdgeColor', 'none','FaceAlpha', .4,'FaceColor','b')
axis equal;
hold all
plot3(r_eci_km.Data(:,1),r_eci_km.Data(:,2),r_eci_km.Data(:,3),'r','LineWidth',3)


% Ground Track
% Plots the Lat Lon of the mission with varying time errors
% Author: Devan Tormey

lon_seattle = -122.3321;
lat_seattle = 47.6062;
s = [-122.3321;47.6062];

t1 = load('t0.mat');
t2 = load('t0_p_1week.mat');
t3 = load('t0_p_1month.mat');

%% 
figure()
hold all
plot(t1.lat_lon_alt.Data(1,2),t1.lat_lon_alt.Data(1,1),'b*','LineWidth',2)
plot(t1.lat_lon_alt.Data(:,2),t1.lat_lon_alt.Data(:,1),'b.','LineWidth',2)
plot(t2.lat_lon_alt.Data(1,2),t1.lat_lon_alt.Data(1,1),'r*','LineWidth',2)
plot(t2.lat_lon_alt.Data(:,2),t2.lat_lon_alt.Data(:,1),'r.','LineWidth',2)
plot(t3.lat_lon_alt.Data(1,2),t3.lat_lon_alt.Data(1,1),'y*','LineWidth',2)
plot(t3.lat_lon_alt.Data(:,2),t3.lat_lon_alt.Data(:,1),'y.','LineWidth',2)
plot(lon_seattle,lat_seattle,'*','LineWidth',2)

% 
% tol = 2;
% dist_v = []
% l = 1;
% for k = 1:1:length(lat_lon_alt.Data(:,2))
%     p = [lat_lon_alt.Data(k,2);lat_lon_alt.Data(k,1)];
%     dist = norm(p - s);
%     if dist < tol
%         dist_v(l,1) = lat_lon_alt.Data(k,2);
%         dist_v(l,2) = lat_lon_alt.Data(k,1);
%         l = l + 1;
%     end
% end
% 
% plot( dist_v(:,1), dist_v(:,2),'.')
% title('Ground Track')
legend('t1 start','t1','t1 + 1 week start','t1 + 1 week','t1 + 1 month start','t1 + 1 month','Seattle','FontSize',14)
title('Ground Track (r0,v0 fixed t0 varied)')

ylim([-90 90])
xlim([-180 180])

hold on
I = imread('ORd8G.png'); 
h = image([-180 180],-[-90 90],I); 
uistack(h,'bottom')
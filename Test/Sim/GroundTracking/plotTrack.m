% Ground Track
% Plots the Lat Lon of the mission
% Author: Devan Tormey

lon_seattle = -122.3321;
lat_seattle = 47.6062;
s = [-122.3321;47.6062];


figure()
hold all
plot(lat_lon_alt.Data(:,2),lat_lon_alt.Data(:,1),'.','LineWidth',2)
plot(lon_seattle,lat_seattle,'*','LineWidth',2)


tol = 2;
dist_v = []
l = 1;
for k = 1:1:length(lat_lon_alt.Data(:,2))
    p = [lat_lon_alt.Data(k,2);lat_lon_alt.Data(k,1)];
    dist = norm(p - s);
    if dist < tol
        dist_v(l,1) = lat_lon_alt.Data(k,2);
        dist_v(l,2) = lat_lon_alt.Data(k,1);
        l = l + 1;
    end
end

plot( dist_v(:,1), dist_v(:,2),'.')
title('Ground Track')
legend('Ground Track','Seattle','Within 10 degrees (euclidean)')
ylim([-90 90])
xlim([-180 180])

hold on
I = imread('ORd8G.png'); 
h = image([-180 180],-[-90 90],I); 
uistack(h,'bottom')
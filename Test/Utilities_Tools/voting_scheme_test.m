m1 = rand(3,1)
m2 = rand(3,1)
m3 = rand(3,1)


meas=vote(m1,m2,m3)


% Plot The stuff so we can see if it worked
X = [m1(1) m2(1) m3(1)];
Y = [m1(2) m2(2) m3(2)];
Z = [m1(3) m2(3) m3(3)];
figure()
plot3(X,Y,Z,'*')
hold on
plot3(meas(1),meas(2),meas(3),'o')

function meas = vote(p1,p2,p3)
% Need to check distance of every permutaion:
% p1 p2 -> dist 1
% p1 p3 -> dist 2
% p2 p3 -> dist 3
% Use the distance formula in 3d space
dist1 = distance(p1,p2);
dist2 = distance(p1,p3);
dist3 = distance(p2,p3);

% Pick out the smalles distance and take the corresponding average:
if dist1 == min([dist1 dist2 dist3])
    meas = (p1 + p2)/2;
end
if dist2 == min([dist1 dist2 dist3])
    meas = (p1 + p3)/2;
end
if dist3 == min([dist1 dist2 dist3])
    meas = (p2 + p3)/2;
end

end

% Distance formula in 3D
function [dist] = distance(p1,p2)

dist = sqrt((p1(1) - p2(1)).^2+(p1(2) - p2(2)).^2+(p1(3) - p2(3)).^2);

end

 




initialConditions = struct;
% Calculate an initial r and v
r = [500+fswParams.constants.global.r_earth_km;0;0];
v = [0;sqrt(fswParams.constants.global.mu_earth_km3s2/norm(r));0];

qt = rand(4,1);
initialConditions.q0 = qt/norm(qt);
initialConditions.w0 = rand(3,1); 
initialConditions.r0 = r;
initialConditions.v0 = v;



simParams.initialConditions = initialConditions;

clear qt r v initialConditions;

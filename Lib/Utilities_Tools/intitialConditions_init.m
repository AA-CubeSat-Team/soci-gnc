 




initialConditions = struct;


qt = rand(4,1);
initialConditions.q0 = qt/norm(qt);
initialConditions.w0 = rand(3,1); 
initialConditions.r0 = [3829.45; -888.41; 5459.13];
initialConditions.v0 = [2.5396; 7.2434; -0.6063];



simParams.initialConditions = initialConditions;

clear qt q0 w0 r0 v0 initialConditions;

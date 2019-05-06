 




initialConditions = struct;


qt = rand(4,1);
initialConditions.q0 = qt/norm(qt);
initialConditions.w0 = rand(3,1); 
initialConditions.r0 = [6.8781e+03; 0; 0];
initialConditions.v0 = [0; 7.6124; 0];



simParams.initialConditions = initialConditions;

clear qt q0 w0 r0 v0 initialConditions;

% Initialization of the desat controller test.
%
%
% Author: Cole Morgan

w0 = [1;1;1]*1.5; %loads the sc up with a lot of angular momentum
simParams.initialConditions.w0 = w0;

simParams.test.controllers.desaturation.MTQ_time_on = 200; % time that the MTQ
% gets "turned on" in the test.
 
clear  w0
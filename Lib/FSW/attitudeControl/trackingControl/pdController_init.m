% Initialization of the pd controller
% Each Controller is found from a basic 1st order TF
% Author: Devan Tormey

tracking = struct;

%choices for Kp and Kd depend on zeta and wn

z = 1; %Critically Damped
% z = .7 %Damped
% z = .1 %under damped

% wn is based on the assumption that our impulses are around this frequency
% A couple different choices for wn are dependant on what kinda stuff we
% think we need ot react to
wn = .017; %this corresponds to movement speeds of 1 deg/sec
wn = .017*2; %this corresponds to doubling ^^ for margins
% wn = .007 %assuming 60 degrees in 5 minutes
J = simParams.scParams.J;

tracking.Kd1 = 2*z*wn*J;
tracking.Kp1 = wn.^2*J;
tracking.qd1 =[1;0;0;0];

fswParams.controllers.tracking = tracking;

clear tracking z wn J
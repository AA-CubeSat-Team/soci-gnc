% Atmospheric Drag Simulation Initialization
%Author Kate Williams 
% Description: Create variables for running the atmospheric drag model.
atmoDrag = struct;

atmoDrag.muh= 3.986004418e14;%m^3/s^2,assumed constant
%u_h= muh/(500e3); %muh/(altitude of cubesat in meters),assumed constant
atmoDrag.pos= 6.38*10^6+500*10^3;%m, assume orbit of 500km plus radius of earth
atmoDrag.mE=5.98*10^24 ;%kg, mass of earth


simParams.atmoDrag = atmoDrag;
clear atmoDrag
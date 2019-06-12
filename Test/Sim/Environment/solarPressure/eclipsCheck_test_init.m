
clc;


r_sun = [-.5090360;-.2207008]

r_sat = [-4464.696;-5102.509;]


 LIGHT = fcn(r_sun,r_sat,simParams)
 
 

function LIGHT = fcn(sunB,scB,simParams)
% DESCRIPTION
% ~~~~~~~~~~~~~
% This function computes the mean longitude phi_s and mean anomoly M_s of
% the sun from an incoming time stampe Tut1. Tut1 is computed using the
% BLANK formula
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Variables
% sunI - this is the sun from the inertial frame
% scI - this is the spacecraft position from inertial frame
% ECLIPSE - will be a 1 or 0 if we are in/out of eclipse
% Re - is the earth radius
% AU2Km - convert from AU to km
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
LIGHT = 0;

Re = simParams.scParams.Re_km;

AU2Km = 149598073;

sunB = sunB*AU2Km;

tmin = ( norm(scB)^2 - dot(scB,sunB) )/ ( norm(scB)^2 +  norm(sunB)^2 - 2*(dot(scB,sunB)) );

if (tmin < 0) || (tmin > 1)
    LIGHT = 1;
end
if (1 - tmin)*norm(scB)^2 + dot(scB,sunB)*tmin >= 1.0 * Re.^2
    LIGHT = 1;
end

end





function [r_km, v_kmps] = orb2eci(coe)
%ORB2ECI
%
% Convert classical orbital elements to inertial position and velocity.
% Inertial frame matches that which is defined by the incoming orbital
% elements.
%
% Inputs: 
%   - coe [6x1] : set of classical orbital elements with
%            coe(1) = semimajor axis [km]
%            coe(2) = eccentricity [-] in [0,1)
%            coe(3) = inclination [rad] in [0,pi]
%            coe(5) = right ascension of ascending node [rad] in [0,2*pi]
%            coe(4) = argument of perigee [rad] in [0,2*pi]
%            coe(6) = true anomaly [rad] in [0,2*pi]
%
% Outputs:
%   - r [3x1] : inertial position [km]
%   - v [3x1] : inertial velocity [km/s]
%
% T. P. Reynolds

% constants
mu = 398600.4418; % [km3/s2] standard gravitational parameter for the earth

% unload orbital elements array  
a       = coe(1);
ECC     = coe(2);
INC     = coe(3);
RAAN    = coe(4);
AOP     = coe(5);
TRA     = coe(6);

sTRA = sin(TRA);
cTRA = cos(TRA);

% compute semiparameter
p = a * (1 - ECC * ECC);

% compute position and velocity in perifocal frame
den  = 1 + ECC * cos(TRA);
temp = sqrt(mu/p); 
r_PQW = [ p*cTRA/den; p*sTRA/den; 0.0 ];
v_PQW = [ -temp*sTRA; temp*(ECC+cTRA); 0.0 ];

% compute rotation from perifocal to inertial frame
R = rot(-RAAN,'z') * rot(-INC,'x') * rot(-AOP,'z');

% rotate into the inertial frame
r_km    = R * r_PQW;
v_kmps  = R * v_PQW;

end

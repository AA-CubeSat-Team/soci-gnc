function [r_km,v_kmps,exitflag] = coe2rv(a,e,i,O,w,M)
%COE2RV 
%
% Computes an inertial position and velocity from classical orbital
% elements. 
%
% Inputs: - (a,e,i,O,w,M) with all angles in degrees and a in meters.
% Outputs:  - inertial position rI
%           - inertial velocity vI
%           - exitflag; 0 nominal, -1 if eccentricity is one, 
%               -2 if Kepler did not converge.
%
% T. Reynolds -- RAIN Lab

% Constants
constants;

% convert to km (smaller numbers) and radians
muE_km = muE * (M2KM.^3); % [km3/s2]
a_km   = a * M2KM;
i       = DEG2RAD * i;
O       = DEG2RAD * O;
w       = DEG2RAD * w;
M       = DEG2RAD * M;

% solve kepler's equation for true anomaly
[~,theta,exitflag] = kepler(M,e);

if ( abs(e-1) < small )
    exitflag = -1;
end

slr     = a_km * (1 - e * e); % semi-latus rectum

c1      = sqrt(muE_km/slr);
c2      = 1 + e*cos(theta);

r_PQW   = [ slr*cos(theta)/c2; slr*sin(theta)/c2; 0 ];
v_PQW   = [ -c1*sin(theta); c1*(e + cos(theta)); 0];

C       = rot3(-O)*rot1(-i)*rot3(-w);

r_km    = C*r_PQW;
v_kmps  = C*v_PQW;

end

function C = rot1(x)
    C   = [ 1.0   0.0     0.0;
            0.0   cos(x)  sin(x);
            0.0  -sin(x)  cos(x) ];
end

function C = rot3(x)
    C   = [ cos(x)  sin(x)  0.0;
           -sin(x)  cos(x)  0.0;
            0.0     0.0     1.0 ];
end


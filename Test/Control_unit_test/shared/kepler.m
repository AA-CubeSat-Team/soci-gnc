function [E, TRA, FLAG] = kepler(MNA, ECC)
%KEPLER
%
% Inputs:  - MNA is MeaN Anomaly
%          - ECC is ECCentricity
% Outputs: - TRA is TRue Anomaly
%          - E   is Eccentric Anomaly
%          - exitflag is 0 nominally, -1 if ECC is equal to 1, and -2 if 
%               reached max iterations.
%
% Solves Kepler's equation for elliptic orbits using Newton-Raphson
%
% T. Reynolds -- RAIN Lab

% Constants
constants;
tol         = 1e-8;
twopi       = 2 * pi;
i_max       = 10;
FLAG        = 0;

% Project onto [-2pi,2pi]
if ( abs(MNA) > twopi )
    MNA = sign(MNA)*twopi;
end

% Initial guess
if ( (-pi < MNA && MNA < 0) || (MNA > pi) )
    E   = MNA - ECC;
else
    E   = MNA + ECC;
end

% Run Loop
Enew    = 1e6;
for i = 1:i_max
    den     = 1 - ECC*cos(E);
    if( abs(den) > small ) % avoid dividing by zero
        Enew    = E + (MNA - E + ECC*sin(E))/den;
    else
        FLAG    = -1;
    end
    
    err     = abs(E - Enew);
    if( err < tol )
        break;
    end
    E   = Enew;
end

if ( i == i_max )
    FLAG = -2;
end

% Compute true anomaly
if ( abs(1-ECC) < small )
    TRA     = 0;
    FLAG    = -1;
else
    c1      = sqrt( (1 + ECC) / (1 - ECC) );
    temp    = c1 * tan(0.5*E);
    TRA     = mod(2 * atan(temp), 2*pi);
end

end


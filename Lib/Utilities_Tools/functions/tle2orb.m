function coe = tle2orb(orbit_tle,anomaly)
%TLE2ORB
%
% Convert the output of a call to get_tle() to a set of orbital elements.
% Assumes an elliptic or circular inclined orbit. 
%
% Inputs:
%   - orbit_tle [9x1] : output of a call to get_tle(<filename>.txt)
%   - anomaly [string] : select between "true", "mean", and "ecc"entric anomaly
%   as the sixth orbital element. Default is "true".
%
% Outputs:
%   - coe [6x1] : classical orbital elements
%                   - semimajor axis                        [km]
%                   - eccentricity                          [-]
%                   - inclination                           [deg]
%                   - right ascension of ascending node     [deg]
%                   - argument of perigee                   [deg]
%                   - anomaly (true, mean, or ecc)          [deg]
%
% T. P. Reynolds

if (nargin<2)
    anomaly = 'true';
else
    try
        assert( isequal(anomaly,'true') ...
            || isequal(anomaly,'mean') ...
            || isequal(anomaly,'ecc') )
    catch
        error('Second input must be one of "true", "mean" or "ecc"')
    end
end

mu  = 398600.4418; % [km3/s2] standard gravitational parameter for the earth
   
INC     = orbit_tle(4);      % Inclination [deg]           
RAAN    = orbit_tle(5);      % Right Ascension of the Ascending Node [deg]
ECC     = orbit_tle(6);      % Eccentricity [-]
AOP     = orbit_tle(7);      % Argument Of Periapsis [deg]
MNA     = orbit_tle(8);      % MeaN Anomaly [deg]
MNM     = orbit_tle(9);      % MeaN Motion [Revs per day]

% compute semimajor axis
a = (mu/(MNM*2*pi/(24*3600))^2)^(1/3); % [km]    

% Calculate the desired anomaly 
switch anomaly
    case {'true','ecc'}
        
        % solve Kepler's equation for eccentric anomaly
        M = deg2rad(MNA);
        if ( ((-pi<M)&&(M<0)) || (M>pi) )
            E = M - ECC;
        else
            E = M + ECC;
        end
        done = false;
        iter = 0;
        
        while ( ~done && iter<30 )
            num = M - E + ECC * sin(E);
            den = 1 - ECC * cos(E);
            % compute new eccentric anomaly
            E_  =  E + num/den;
            % check to see if error tolerance is met
            if ( abs(E_ - E) < 1e-8)
                done = true;
            end
            % update E and increment iteration counter
            E = E_;
            iter = iter + 1;
        end
        
        if isequal(anomaly,'true')
            % solve for true anomaly
            temp = sqrt( (1+ECC)/(1-ECC) );
             % correct for atan behaviour
            if ( E > pi/2 && E < 3*pi/2 )
                add = pi;
            elseif ( E > 3*pi/2 )
                add = 2*pi;
            elseif ( E < -pi/2 && E > -3*pi/2 )
                add = -pi;
            elseif ( E < -3*pi/2 )
                add = -2*pi;
            else
                add = 0.0;
            end
            ANM = rad2deg( 2 * ( atan( temp * tan(E/2) ) + add ) );
        else
            ANM = rad2deg(E);
        end
        
    case 'mean'
        ANM = MNA;     
end

% return orbital elements 
coe = [ a; ECC; INC; RAAN; AOP; ANM ];

end
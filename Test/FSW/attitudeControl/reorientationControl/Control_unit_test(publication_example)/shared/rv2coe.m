 function [a,e,i,O,w,M,exitflag] = rv2coe(r_km,v_kmps)
%RV2COE 
%
% Converts inertial position and velocity to classical orbital elements.
%
% Inputs: - r_km == inertial position vector [kilometers]
%         - v_kmps == inertial velocity vector [kilometers/second]
% Outputs: - (a,e,i,O,w,M,exitflag), where the first six are classical
%     orbital elements, and exitflag is 0 nominally and -1 if any orbit
%     degeneracies are noted (e.g., e = 1, i < 0, etc.). All angles in
%     degrees.
%
% References: -Spacecraft Dynamics and Control, M. Sidi. 
%             -Vallado 4e, Algorithm 9 pp 113-114.
% 
% T. Reynolds -- RAIN Lab

% a == semi-major axis
% e == eccentricity
% i == orbital inclination [degrees]
% O == right ascension of ascending node [degrees]
% w == argument of perigee [degrees]
% M == mean anomaly [degrees]

% Constants
constants;
muE_km      = muE * (M2KM.^3); % km3/s2
twopi       = 2.0 * pi;
rE_km       = rE * M2KM; % km
exitflag    = 0; % exit flag; flipped to -1 if there is a perceived error
r           = r_km;
v           = v_kmps;

% -------------------------  Implementation   --------------------------- %
magr = norm( r );
magv = norm( v );

% find h n and e vectors
hbar    = cross( r,v );
magh    = norm( hbar );
nbar    = [ -hbar(2); hbar(1); 0.0 ];
magn    = norm( nbar );
c1      = magv*magv - muE_km /magr;
rdotv   = dot( r,v );

% find eccentricity
ebar    = zeros(3,1);
for i = 1:3
    ebar(i)     = (c1*r(i) - rdotv*v(i))/muE_km;
end
e     = norm( ebar );
if( abs(e - 1.0) < small )
    exitflag = -1;
end

% find a e and semi-latus rectum 
sme     = ( magv*magv*0.5  ) - ( muE_km /magr );
if( (exitflag ~= -1) && (abs(sme) > small) )
    a   = (- muE_km / (2.0 * sme)) * KM2M;
else
    a   = Inf;
end
if( a < rE_km )
    exitflag = -1;
end

% find mean motion
% n     = sqrt(muE_km/a^3);
% n     = n/(twopi/DAY2SEC);

% find inclination 
hk      = hbar(3)/magh;
i     = acos( hk );
if( i < 0.0 )
    exitflag    = -1; 
end

% find longitude of ascending node 
O    = 0.0;
if ( magn > small )
    temp = nbar(1) / magn;
    if ( abs(temp) > 1.0  )
        temp = sign(temp); % projects into [-1,1] for acos
    end
    O = acos( temp );
    if ( nbar(2) < 0.0  )
        O = twopi - O;
    end
else
    exitflag    = -1;
end

% find argument of perigee
w     = 0.0;
temp = dot( nbar,ebar );
if( (magn > small) && (e > small) )
    temp2   = temp/(magn*e);
    if( abs(temp2) > 1.0 )
        temp2   = sign(temp2);
    end
    w     = acos(temp2);
else
    exitflag = -1;
end
if ( ebar(3) < 0.0  )
    w     = twopi - w;
end

% find true anomaly at epoch
nu      = 0.0;
temp    = dot( ebar,r );
if( (e > small) && (magr > small) )
    temp2   = temp/(e*magr);
    if( abs(temp2) > 1.0 )
        temp2   = sign(temp2);
    end
    nu  = acos(temp2);
else
    exitflag = -1;
end
if ( rdotv < 0.0  )
    nu  = twopi - nu;
end

% find mean anomaly for all orbits 
[~,M,exitflag] = newtonnu(e,nu,exitflag);

% Convert to degrees
i = RAD2DEG*i;
O = RAD2DEG*O;
w = RAD2DEG*w;
M = RAD2DEG*M;

end

function [e0,m,FLAG] = newtonnu ( ecc,nu,FLAG )

% Constants
e0      = 1e6;
m       = 1e6;
small   = 1e-10;

if ( abs( ecc ) < small ) % circular 
    m   = nu;
    e0  = nu;
else % elliptical
    if ( ecc < 1.0-small )
        sine    = (sqrt( 1.0 - ecc*ecc ) * sin(nu)) / (1.0 + ecc*cos(nu));
        cose    = (ecc + cos(nu)) / (1.0 + ecc*cos(nu));
        e0      = atan2( sine,cose );
        m       = e0 - ecc*sin(e0);
    else
        % For hyperbolic or parabolic orbits
        FLAG    = -1;
    end
end

if ( ecc < 1.0 )
    m   = rem( m,2.0*pi );
    if ( m < 0.0 )
        m   = m + 2.0*pi;
    end
    e0  = rem( e0,2.0*pi );
end

end


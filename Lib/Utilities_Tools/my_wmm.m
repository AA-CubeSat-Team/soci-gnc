function [B_ned_nT] = my_wmm(lat,lon,alt,dyear)
%MY_WMM   World Magnetic Model
%
% B_NED_nT = my_wmm(lat,lon,alt,dyear) returns the magnetic field vector at
% the current latitude, longitude and altitude at the time specified by the 
% input dyear (decimal year). LLA can (should) be the output of the matlab
% function ecef2lla.m to make things simple. 
%
% Inputs:
%   - lat : geodetic latitude [degrees]
%   - lon : geodetic longitude [degrees]
%   - alt : altitude above the WGS84 ellipsoid [km]
%   - dyear : decimal year (e.g. 2016.25) MUST be greater than 2015.0
%
% Outputs: 
%   - B_ned_nT : magnetic field vector in the North-East-Down frame with
%   units of nanoTesla.
%
% Current coefficients: WMM 2015v2 -- see Include/WMM_2015v2.COF file
% NOAA publishes user manuals, coefficient files and some software on their
% webiste here: https://www.ngdc.noaa.gov/geomag/WMM/soft.shtml#downloads
% This function was built from the WMM2015_Report.pdf 
%
% T. Reynolds -- RAIN Lab

%#codegen

% Constants
A       = 6378137;          % semi major axis [m]
a       = 6371200;          % geomagnetic reference radius
f       = 1/298.257223563;  % reciprocal flatening
e2      = f*(2-f);          % eccentricity squared
ord     = 12;               % model order 
maxord  = ord+1;
DEG2RAD = pi/180;
wmm     = load('WMM.mat'); % Get coefficient data
t0      = wmm.wmm.year; 
g       = wmm.wmm.g;
h       = wmm.wmm.h;
dg      = wmm.wmm.dg;
dh      = wmm.wmm.dh;

% map inputs to right units
lat   = DEG2RAD * lat;
lon   = DEG2RAD * lon;
% alt   = KM2M * alt;
if (dyear < t0)
    error('\t MY_WMM: Input DYEAR must be greater than %f.',t0)
end
dt = dyear - t0;    % time since epoch
crlat = cos(lat);
srlat = sin(lat);
crlon = cos(lon);
srlon = sin(lon);

% clever recursive way of computing sin(m*lon) and cos(m*lon)
sp      = zeros(ord+1,1);
cp      = zeros(ord+1,1);
sp(2)   = srlon;
cp(1)   = 1.0; cp(2) = crlon;
for m=3:ord+1
    sp(m) = sp(2)*cp(m-1)+cp(2)*sp(m-1);
    cp(m) = cp(2)*cp(m-1)-sp(2)*sp(m-1);
end

% Step 1
Rc      = A/(sqrt(1-e2*srlat^2));   % normal section at latitude
p       = (Rc+alt) * crlat;
z       = (Rc*(1-e2)+alt)*srlat;
r       = sqrt(p^2+z^2);            % geocentric altitude
lat_gc  = asin(z/r);                % geocentric latitude
srlat   = sin(lat_gc);
aor     = a/r;                      % a over r
ar      = aor * aor;                % starts of squared, increases with n

% compute legendre polynomials
P   = zeros(maxord+1,maxord+1); % zeroth row and col added
x   = srlat;
xx  = sqrt(1-x*x);
trlat   = tan(lat_gc);
secrlat = sec(lat_gc);
P(1,1) = 1.0;           % this is P_0^0(x) = 1;
P(2,1) = x;             % this is P_1^0(x) = x;
P(2,2) = -xx;           % this is P_1^1(x) = -(1-x^2)^{1/2}
for n = 2:maxord    
    P(n+1,1) = (1/n)*(x*(2*n-1)*P(n,1) - (n-1)*P(n-1,1));
    for m = 1:n
        P(n+1,m+1) = (1/xx)*( (n-m+1)*x*P(n+1,m) - (n+m-1)*P(n,m) );
        if (m>1 && (n-m)>0)
            snorm = (-1)^(m-1) * sqrt(2*factorial(n-2-m+1)/factorial(n-2+m-1));
            P(n-1,m) = snorm * P(n-1,m);
        end
        if (m>1 && n==maxord)
            snorm = (-1)^(m-1) * sqrt(2*factorial(n-1-m+1)/factorial(n-1+m-1));
            P(n,m) = snorm * P(n,m);
            snorm = (-1)^(m-1) * sqrt(2*factorial(n-m+1)/factorial(n+m-1));
            P(n+1,m) = snorm * P(n+1,m);
        end
    end 
end
snorm = (-1)^(m) * sqrt(2*factorial(n-m)/factorial(n+m));
P(n+1,m+1) = snorm * P(n+1,m+1);

% Step 2 and 3 - main loop to compute components of B
bx = 0.0;
by = 0.0;
bz = 0.0;
for n = 1:ord
    ar    = ar * aor;
    for m = 0:n
        % derivative of lagrange polynomial P_n^m
        DPnm = (n+1)*trlat*P(n+1,m+1) - sqrt((n+1)^2-m^2)*secrlat*P(n+2,m+1);
        
        % adjust the Gauss coefficients for time elapsed since epoch
        G = g(n,m+1) + dt * dg(n,m+1);
        H = h(n,m+1) + dt * dh(n,m+1);
        
        % accumulate terms of spherical harmonic expansion
        bx = bx - ar * (G*cp(m+1)+H*sp(m+1))*DPnm;
        by = by + ar * m*(G*sp(m+1)-H*cp(m+1))*P(n+1,m+1);
        bz = bz - (n+1)*ar * (G*cp(m+1)+H*sp(m+1))*P(n+1,m+1);
        
    end
end

% Step 4 - rotate into the ellipsoidal reference frame
BX = bx*cos(lat_gc-lat) - bz*sin(lat_gc-lat);
BY = sec(lat_gc)*by;
BZ = bx*sin(lat_gc-lat) + bz*cos(lat_gc-lat);

% output final B vector
B_ned_nT = [BX; BY; BZ];

end




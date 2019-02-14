function [st,stdot] = sidereal(jdut1,deltapsi,meaneps,omega,lod)

%SUMMARY: Tthis function calulates the transformation matrix that accounts for the
%    effects of sidereal time.
% inputs          description                    range / units
%    jdut1       - julian centuries of ut1        days
%    deltapsi    - nutation angle                 rad
%    meaneps     - mean obliquity of the ecliptic rad
%    omega       - long of asc node of moon       rad
%    lod         - length of day                  sec
%    eqeterms    - terms for ast calculation      0,2
%
%  outputs       :
%    st          - transformation matrix for pef - tod
%    stdot       - transformation matrix for pef - tod rate
%  locals        :
%    gmst        - mean greenwich sidereal time   0 to 2pi rad
%    ast         - apparent gmst                   0 to 2pi rad
%    hr          - hour                           hr
%    min         - minutes                        min
%    sec         - seconds                        sec
%    temp        - temporary vector
%    tempval     - temporary variable

% Constants
twopi      = 2.0*pi;
deg2rad    = pi/180.0;

% ------------------------  Find GST   ------------------
% ////////////////////////////////////////////////////////

tut1= ( jdut1 - 2451545.0 ) / 36525.0;

temp = - 6.2e-6 * tut1 * tut1 * tut1 + 0.093104 * tut1 * tut1  ...
               + (876600.0 * 3600.0 + 8640184.812866) * tut1 +...
               67310.54841; %Vallado Online Code

% 360/86400 = 1/240, to deg, to rad
temp = mod(temp*deg2rad/240.0,twopi);

% ------------------------ check quadrants -----------------
        if ( temp < 0.0 )
            temp = temp + twopi;
        end

gmst = temp;

% ////////////////////////////////////////////////////////
% ----------------------------------------------------------


% ------------------------ Find Mean AST ------------------
% ////////////////////////////////////////////////////////

if (jdut1 > 2450449.5 ) && (eqeterms > 0)
    ast= gmst + deltapsi* cos(meaneps) ...
        + 0.00264*pi /(3600*180)*sin(omega) ...
        + 0.000063*pi /(3600*180)*sin(2.0 *omega);
else
    ast= gmst + deltapsi* cos(meaneps);
end

ast        = mod(ast, 2.0*pi);
thetasa    = 7.29211514670698e-05 * (1.0  - lod/86400.0 );
omegaearth = thetasa;

% ////////////////////////////////////////////////////////
% ----------------------------------------------------------

% -------------- Calculate the Rotation Matrices -------------
% /////////////////////////////////////////////////////////////
%fprintf(1,'st gmst %11.8f ast %11.8f ome  %11.8f \n', gmst*180/pi, ast*180/pi, omegaearth*180/pi );

        st(1,1) =  cos(ast);
        st(1,2) = -sin(ast);
        st(1,3) =  0.0;
        st(2,1) =  sin(ast);
        st(2,2) =  cos(ast);
        st(2,3) =  0.0;
        st(3,1) =  0.0;
        st(3,2) =  0.0;
        st(3,3) =  1.0;

% compute sidereal time rate matrix
        stdot(1,1) = -omegaearth * sin(ast);
        stdot(1,2) = -omegaearth * cos(ast);
        stdot(1,3) =  0.0;
        stdot(2,1) =  omegaearth * cos(ast);
        stdot(2,2) = -omegaearth * sin(ast);
        stdot(2,3) =  0.0;
        stdot(3,1) =  0.0;
        stdot(3,2) =  0.0;
        stdot(3,3) =  0.0;
        
% ////////////////////////////////////////////////////////
% ----------------------------------------------------------

end


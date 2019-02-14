%Author Kate Williams
%Date 1/24/2019

%Last edit by Kate Williams 2/14/2019, extended table an additional 10
%terms
%conversions
function [deltapsi, trueeps, meaneps,nut,M_moon,M_sun,U_moon,D_sun,O_moon] = nutation(ttt)
        %OUTPUT ANGLES IN RADIANTS
        deg2rad = pi/180.0; %deg to rad
        rad2deg = 1/deg2rad;
        asec2rad = 1/3600*deg2rad;
        ttt2= ttt*ttt; %ttt is julian century in tt time frame
        ttt3= ttt2*ttt;
        
        %mean obliquity of the ecliptic in rads
        meaneps = deg2rad * ( 23.439291 ...
                        - 0.0130042 * ttt ...
                        - 1.64e-7 * ttt2 ...
                        + 5.04e-7 * ttt3);
                % ---- iau 1980 theory
% Largest Nutation coefficents (out of 106)                    
        nc = [ ...
            1   0   0   0   0   1   -171996 -174.2  92025   8.9
            9   0   0   2   -2  2   -13187  -1.6    5736    -3.1
            31  0   0   2   0   2   -2274   -0.2    977     -0.5
            2   0   0   0   0   2   2062    0.2     -895    0.5
            10  0   1   0  	0   0   1426    -3.4    54      -0.1
            32  1   0   0   0   0   712     0.1     -7      0.0
            11  0   1   2   -2  2   -517    1.2     224     -0.6
            33  0   0   2   0   1   -386    -0.4    200     0.0
            34  1   0   2   0   2   -301    0.0     129     -0.1
            12  0   -1  2   -2  2   217     -0.5    -95     0.3
            35  1   0   0   -2  0   -158    0.0     -1      0.0
            13  0   0   2   -2  1   129     0.1     -70     0.0 
            36  -1  0   2   0   2   123     0.0     -53     0.0 
            38  1   0   0   0   1   63      0.1     -33     0.0
            37  0   0   0   2   0   63      0.0     -2      0.0
            40  -1  0   2   2   2   -59     0.0     26      0.0
            39  -1  0   0   0   1   -58     -0.1    32      0.0
            41  1   0   2   0   1   -51     0.0     27      0.0
            14  2   0   0   -2  0   48      0.0     1       0.0
            3   -2  0   2   0   1   46      0.0     -24     0.0
            42  0   0   2   2   2   -38     0.0     16      0.0
            45  2   0   2   0   2   -31     0.0     13      0.0
            43  2   0   0   0   0   29      0.0     -1      0.0
            44  1   0   2   -2  2   29      0.0     -12     0.0
            46  0   0   2   0   0   26      0.0     -1      0.0
            15  0   0   2   -2  0   -22     0.0     0       0.0
            47  -1  0   2   0   1   21      0.0     -10     0.0
            16  0   2   0   0   0   17      -0.1    0       0.0
            18  0   2   2   -2  2   -16     0.1     7       0.0
            48  -1  0   0   2   1   16      0.0     -8      0.0 ...
            ];
        
        M_moon	=   deg2rad * ( 134.96298139+(1325 * 360 + 198.8673981) * ttt ...
                      	+ 0.0086972 * ttt2 + 1.78e-5 * ttt3);
               
        M_sun	=   deg2rad * ( 357.52772333 + (99 * 360 + 359.0503400) * ttt ...
                        - 0.0001603 * ttt2 - 3.3e-6 * ttt3);

        U_moon	=   deg2rad * ( 93.27191028 + (1342 * 360 + 82.0175381) * ttt ...
                        - 0.0036825 * ttt2 + 3.1e-6 * ttt3);

        D_sun	=   deg2rad * ( 297.85036306 + (1236 * 360 + 307.1114800) * ttt ...
                        - 0.0019142 * ttt^2 + 5.3e-6 *ttt^3);

        O_moon	=   deg2rad * ( 125.04452222 - (5 * 360 + 134.1362608) * ttt ...
                        + 0.0020708 * ttt^2 + 2.2e-6 * ttt^3);       
            
        % ---- ANGLES of nutation from equ 3-82 of vallado 
        M_moon    = rem( M_moon,360.0  )     * deg2rad; % rad %moon
        M_sun   = rem( M_sun,360.0  )    * deg2rad;%sun
        U_moon    = rem( U_moon,360.0  )     * deg2rad;%moon
        D_sun    = rem( D_sun,360.0  )     * deg2rad;%sun
        O_moon= rem( O_moon,360.0  ) * deg2rad;%moon
        
        %find nutation in longitude and nutation in obliquity
        deltapsi= 0.0; %nutation angle in rad set initially to zero
        deltaeps= 0.0; %change in obliquity in rad
        
        for i = 1:size(nc,1)
            tempval    =   nc(i,2) * M_moon + nc(i,3) * M_sun + nc(i,4) * U_moon + nc(i,5) * D_sun + nc(i,6) * O_moon;
            deltapsi   =   0.0001 * (nc(i,7) + nc(i,8) * ttt) * sin(tempval) + deltapsi;
            deltaeps   =   0.0001 * (nc(i,9) + nc(i,10) * ttt) * cos(tempval) + deltaeps;
        end

        
        %testing
        deltapsi*asec2rad*rad2deg;
        deltaeps*asec2rad*rad2deg;
        
        %final nutation parameters, see page 226 equ. 3-85of Vallado
        trueeps  = meaneps + deltaeps*asec2rad; %true obliquity of ecliptic

        %cos and sines of angles to be used in transfer matrix
        cospsi  = cos(deltapsi);
        sinpsi  = sin(deltapsi);
        coseps  = cos(meaneps);
        sineps  = sin(meaneps);
        costrueeps = cos(trueeps);
        sintrueeps = sin(trueeps);

        %complete rotation matrix
        nut=zeros(3);
        nut(1,1) =  cospsi;
        nut(1,2) =  costrueeps * sinpsi;
        nut(1,3) =  sintrueeps * sinpsi;
        nut(2,1) = -coseps * sinpsi;
        nut(2,2) =  costrueeps * coseps * cospsi + sintrueeps * sineps;
        nut(2,3) =  sintrueeps * coseps * cospsi - sineps * costrueeps;
        nut(3,1) = -sineps * sinpsi;
        nut(3,2) =  costrueeps * sineps * cospsi - sintrueeps * coseps;
        nut(3,3) =  sintrueeps * sineps * cospsi + costrueeps * coseps;
end

      %Method 2:three individual rotation matrices that would be multplied together
      %to get the complete rotation matrix, equ 3-86 pg. 226 of Vallado,
      %rot1mat and rot3mat are functions of Vallado's
      %   n1 = rot1mat( trueeps );
      %   n2 = rot3mat( deltapsi );
      %   n3 = rot1mat( -meaneps );
      %   nut = n3*n2*n1

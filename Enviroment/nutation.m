%Author Kate Williams
%Date 1/24/2019


function [deltapsi, trueeps, meaneps,nut] = nutation(ttt)

        deg2rad = pi/180.0; %deg to rad
        [iar80,rar80] = iau80in;  % coeff in deg, for equ. 3-83 of Vallado

        ttt2= ttt*ttt; %ttt is julian century in tt time frame
        ttt3= ttt2*ttt;
        
        %mean obliquity of the ecliptic in rads
        meaneps = -46.8150 *ttt - 0.00059 *ttt2 + 0.001813 *ttt3 + 84381.448;
        meaneps = mod( meaneps/3600.0, 360.0 )* deg2rad; %remainder after division converted to rad

        %find nutation in longitude and nutation in obliquity
        deltapsi= 0.0; %nutation angle in rad set initially to zero
        deltaeps= 0.0; %change in obliquity in rad
        for i= 106:-1: 1 %see page 226 equ. 3-83 of Vallado
            tempval= iar80(i,1)*l + iar80(i,2)*l1 + iar80(i,3)*f + ...
                     iar80(i,4)*d + iar80(i,5)*omega;
            deltapsi= deltapsi + (rar80(i,1)+rar80(i,2)*ttt) * sin( tempval );
            deltaeps= deltaeps + (rar80(i,3)+rar80(i,4)*ttt) * cos( tempval );
        end

        %final nutation parameters, see page 226 equ. 3-85of Vallado
        trueeps  = meaneps + deltaeps; %true obliquity of ecliptic

        %cos and sines of angles to be used in transfer matrix
        cospsi  = cos(deltapsi);
        sinpsi  = sin(deltapsi);
        coseps  = cos(meaneps);
        sineps  = sin(meaneps);
        costrueeps = cos(trueeps);
        sintrueeps = sin(trueeps);

        %complete rotation matrix
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


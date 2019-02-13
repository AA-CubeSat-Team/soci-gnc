%Author Kate Williams
%Date 1/24/2019
function [deltapsi, trueeps, meaneps,nut,mC,mO,umc,dO,omega] = nutation(ttt)
        %OUTPUT ANGLES IN RADIANTS
        deg2rad = pi/180.0; %deg to rad
        rad2deg = 1/deg2rad;
        asec2rad = 1/3600*deg2rad;
        ttt2= ttt*ttt; %ttt is julian century in tt time frame
        ttt3= ttt2*ttt;
        
        %mean obliquity of the ecliptic in rads
        meaneps = -46.8150 *ttt - 0.00059 *ttt2 + 0.001813 *ttt3 + 84381.448;
        meaneps = mod( meaneps/3600.0, 360.0 )* deg2rad; %remainder after division converted to rad
       
        % ---- iau 1980 theory
        nut80=load('nut80.dat');
        iar80 = nut80(:,1:5); %api from equ 3-83 of vallado
        rar80 = nut80(:,6:9); %Ai,Bi,Ci,Di
        
        
        mC = ((((0.064) * ttt + 31.310) * ttt + 1717915922.6330) * ttt) / 3600.0 + 134.96298139;
        mO = ((((-0.012) * ttt - 0.577) * ttt + 129596581.2240) * ttt) / 3600.0 + 357.52772333;
        umc = ((((0.011) * ttt - 13.257) * ttt + 1739527263.1370) * ttt) / 3600.0 + 93.27191028;
        dO = ((((0.019) * ttt - 6.891) * ttt + 1602961601.3280) * ttt) / 3600.0 + 297.85036306;
        omega = ((((0.008) * ttt + 7.455) * ttt - 6962890.5390) * ttt) / 3600.0 + 125.04452222;
            
        % ---- ANGLES of nutation from equ 3-82 of vallado 
        mC    = rem( mC,360.0  )     * deg2rad; % rad %moon
        mO   = rem( mO,360.0  )    * deg2rad;%sun
        umc    = rem( umc,360.0  )     * deg2rad;%moon
        dO    = rem( dO,360.0  )     * deg2rad;%sun
        omega= rem( omega,360.0  ) * deg2rad;%moon
        
        %find nutation in longitude and nutation in obliquity
        deltapsi= 0.0; %nutation angle in rad set initially to zero
        deltaeps= 0.0; %change in obliquity in rad
        for i= 106:-1: 1 %see page 226 equ. 3-83 of Vallado
            tempval= iar80(i,1)*mC + iar80(i,2)*mO + iar80(i,3)*umc + ...
                     iar80(i,4)*dO + iar80(i,5)*omega;
            deltapsi= deltapsi + ((rar80(i,1)+rar80(i,2)*ttt))*0.0001 * sin(tempval);
            deltaeps= deltaeps + ((rar80(i,3)+rar80(i,4)*ttt))*0.0001 * cos(tempval);
        end
        deltapsi*asec2rad*rad2deg;
        deltaeps*asec2rad*rad2deg;
        
        %final nutation parameters, see page 226 equ. 3-85of Vallado
        trueeps  = meaneps + deltaeps*1/3600*deg2rad; %true obliquity of ecliptic

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
clear all;close all; clc 

%Author Ivan/Kate
%Date 1/23/19



function [recef,vecef,aecef]=eci2ecef_psuedo(ttt,opt,reci,veci,aeci)
%intial parameters 

%*********************** Part 1 Precession *************************
%Calculate the transformation matrix that calculates the effect of
%precession %output from these are psia,wa,ea,xa

%ttt is the julian century in tt
ttt2=tt^2;
ttt3=tt^3;
deg_rad=pi/(180.0*3600.0)

oblo =  84381.406; 
psia =  deg_rad*(((( -0.0000000951 * ttt + 0.000132851 ) * ttt - 0.00114045 ) * ttt - 1.0790069 ) * ttt + 5038.481507 ) * ttt; % "
wa   =  deg_rad*((((  0.0000003337 * ttt - 0.000000467 ) * ttt - 0.00772503 ) * ttt + 0.0512623 ) * ttt -    0.025754 ) * ttt + oblo;
ea   =  deg_rad*(((( -0.0000000434 * ttt - 0.000000576 ) * ttt + 0.00200340 ) * ttt - 0.0001831 ) * ttt -   46.836769 ) * ttt + oblo;
xa   =  deg_rad(((( - 0.0000000560 * ttt + 0.000170663 ) * ttt - 0.00121197 ) * ttt - 2.3814292 ) * ttt +   10.556403 ) * ttt;

zeta =  deg_rad*(((( - 0.0000003173 * ttt - 0.000005971 ) * ttt + 0.01801828 ) * ttt + 0.2988499 ) * ttt + 2306.083227 ) * ttt + 2.650545; % "
theta=  deg_rad*(((( - 0.0000001274 * ttt - 0.000007089 ) * ttt - 0.04182264 ) * ttt - 0.4294934 ) * ttt + 2004.191903 ) * ttt;
z    =  deg_rad*((((   0.0000002904 * ttt - 0.000028596 ) * ttt + 0.01826837 ) * ttt + 1.0927348 ) * ttt + 2306.077181 ) * ttt - 2.650545;


coszeta  = cos(zeta);
sinzeta  = sin(zeta);
costheta = cos(theta);
sintheta = sin(theta);
cosz     = cos(z);
sinz     = sin(z);
 prec(1,1) =  coszeta * costheta * cosz - sinzeta * sinz;
 prec(1,2) =  coszeta * costheta * sinz + sinzeta * cosz;
 prec(1,3) =  coszeta * sintheta;
 prec(2,1) = -sinzeta * costheta * cosz - coszeta * sinz;
 prec(2,2) = -sinzeta * costheta * sinz + coszeta * cosz;
 prec(2,3) = -sinzeta * sintheta;
 prec(3,1) = -sintheta * cosz;
 prec(3,2) = -sintheta * sinz;
 prec(3,3) =  costheta;


          
%*********************** Part 2 Nutation ***************************
%Calculate the transformation matrix that calculates the effect of
%nutation



%*********************** Part 3 Sidereal Time ***************************
%Calculate the transformation matrix that calculates the effect of
%Sidereal Time
[st,stdot] = sidereal(jdut1,deltapsi,meaneps,omega,lod,eqeterms );



%*********************** Part 5 Earth Fixed Parameters ***************************
%Earth fixed parameters of ECI converted to ECEF using transformation
%matrix gathered from parts 1-4

thetasa= 7.29211514670698e-05 * (1.0  - lod/86400.0 );
omegaearth = [0; 0; thetasa;];

rpef  = st'*nut'*prec'*reci;
recef = pm'*rpef;

vpef  = st'*nut'*prec'*veci - cross( omegaearth,rpef );
vecef = pm'*vpef;

temp  = cross(omegaearth,rpef);

aecef = pm'*(st'*nut'*prec'*aeci - cross(omegaearth,temp) ...
                - 2.0*cross(omegaearth,vpef));
            
            
            
            
            
            
            
            
end


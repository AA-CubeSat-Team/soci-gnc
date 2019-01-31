clear all;close all; clc 
%Author-Everybody 
%Date 1/24/19


function [recef,vecef,aecef]=eci2ecef_psuedo(ttt,reci,veci,aeci)
%*********************** Part 1 Precession *************************
%Calculate the transformation matrix that calculates the effect of
%precession %output from these are psia,wa,ea,xa

[prec,psia,wa,ea,xa] = precess_funct(ttt);

%*********************** Part 2 Nutation ***************************
%Calculate the transformation matrix that calculates the effect of
%nutation

[deltapsi, trueeps, meaneps,nut] = nutation(ttt)

%*********************** Part 3 Sidereal Time ***************************
%Calculate the transformation matrix that calculates the effect of
%Sidereal Time


%*********************** Part 4 Polar Motion ***************************
%Calculate the transformation matrix that calculates the effect of
%Polar Motion

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


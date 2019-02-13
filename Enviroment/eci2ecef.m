% TITLE: Test Script for ECEF to ECI (and Vice Versa)
% AUTHOR: Kate,Devin,Ivan
% Date: 2/6/2019
%This script will test the ECI2ECEF function and compare it against the example 3-15 on pg.230. 
%Focusing on just returning recef starting at eci. 

%Variables
%ttt Julian Centuries in Terestrial Time
%jdut1 Julian Centeries in UT1
%lod length of day
%reci position coordinates in eci



function [recef] = eci2ecef(ttt,jdut1,reci)
%*********************** Part 1 Precession *************************
%Calculate the transformation matrix that calculates the effect of
%precession %output from these are psia,wa,ea,xa,zeta,theta,z

[prec,zeta,theta,z] = precess_funct(ttt);

%*********************** Part 2 Nutation ***************************
%Calculate the transformation matrix that calculates the effect of
%nutation

[deltapsi, trueeps, meaneps,nut,mC,mO,umc,dO,omega] = nutation(ttt);

%*********************** Part 3 Sidereal Time ***************************
%Calculate the transformation matrix that calculates the effect of
%Sidereal Time

[st,stdot] = sidereal(jdut1,deltapsi,meaneps,omega);

%*********************** Part 4 Earth Fixed Parameters ***************************
%Earth fixed parameters of ECI converted to ECEF using transformation
%matrix gathered from parts 1-4

%thetasa= 7.29211514670698e-05 * (1.0  - lod/86400.0 );
%omegaearth = [0; 0; thetasa;];

rpef  = st'*nut'*prec'*reci; %This is the final transformation 
rmod = prec'*reci;

recef = rpef;
%vpef  = st'*nut'*prec'*veci - cross( omegaearth,rpef );
%vecef = vpef;
%temp  = cross(omegaearth,rpef);
%aecef = (st'*nut'*prec'*aeci - cross(omegaearth,temp) ...
                %- 2.0*cross(omegaearth,vpef));
end
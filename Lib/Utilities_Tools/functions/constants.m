% Constants
% 
% All units are SI and use MKS as base units.

small = 1.0e-10;
format short g
set(0,'DefaultTextInterpreter','latex',...
    'DefaultLineLineWidth',1,...
    'DefaultAxesFontSize',14)

% conversions
M2KM = 1.0e-3;
KM2M = 1.0e3;
DEG2RAD = pi / 180;
RAD2DEG = 180 / pi;
DAY2SEC = 86400;
SEC2DAY = 1 / 86400;
RPS2RPM = 60/(2*pi);
RPM2RPS = 2*pi/60;

% astrodynamics
G   = 6.672e-11;
AU  = 149597870.0e3;
muS = 1.32712440018e20;
mS  = 1.9891e30;

% earth parameters
muE = 3.986004418e14; 
mE  = 5.9742e24;
rE  = 6378137.0;
wE  = 7.292115e-5; 

% moon parameters
muMo = 4.9048695e12;
E2Mo = 384400.0e3; 
rMo  = 1738.0e3; 
mMo  = 7.3483e22;

% mars parameters
muM = 4.282837e13; 
rM  = 3389.5e3;
mM  = 6.4171e23;

% other
c = 2.99792458e8; 

% matlab plot tools
set(0,'defaulttextinterpreter','latex',...
    'defaultLineLineWidth',1)


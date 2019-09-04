% AA528 HW3
%
% Problem 1
clear variables; close all

% load constants
addpath('shared/')
constants;

% part (a)
e = 0.1;
M = pi/4;

[psi,~,~] = kepler(M,e);

fprintf('For e = %.1f and M = %s we get psi = %0.5f \n',e,'pi/4',psi)

% part (b)
a = 6730.954*KM2M;
e = 0.0006676;
i = 54.615;
O = 247.463;
w = 130.288;
M = 325.277;

[rI_km,vI_kmps,~] = coe2rv(a,e,i,O,w,M);
% the answer should match the prompt from HW1 problem 1 which are
% r = [ 3829.45 -888.41 5459.13 ]
% v = [ 2.5396 7.2434 -0.6063 ]
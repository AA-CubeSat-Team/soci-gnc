
clear all
close all
clc

syms m1 ma k1 ka s
% m1 =4;
% m2 = 20;
% m3 = 2;
% k1 = 14;
% k2 = 2;
% k3 = 6;
% k4 = 2;
M =diag([m1;ma;ma]);
K = [k1+ka, -ka,0;-ka,2*ka,-ka;0,-ka,ka];

%  [V,D] = eig(K,M);
C = eye(3);
B = [1 1;0 0;0 0];
D = zeros(3,1);

G = inv(M*s^2 + K)*B

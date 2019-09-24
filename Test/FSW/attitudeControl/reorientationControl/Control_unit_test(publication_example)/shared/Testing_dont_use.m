clear all; close all; clc;

q = [0.2652; 0.2652; -.6930; 0.61573];
p = [0.2652; 0.2652; -.6930; 1];
s = [0; 0;0;1];
q = q/norm(q);

r = [0.2652, 0.2652, -.6930];

z = quatmultiply(quatconj(q'), s')

% n = quatrotate(q', r)
% dot(n, r)
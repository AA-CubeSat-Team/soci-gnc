% Rigid Body Simulation
%Author: Devan Tormey

clear; clc; close all;


Inertia = eye(3);
qt = rand(4,1);
q0 = qt/norm(qt);
w0 = rand(3,1)

kp = 1

kd = .01


sim('Rigid_Body_control.slx')
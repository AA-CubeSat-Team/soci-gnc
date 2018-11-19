% Rigid Body Control Using Dynamics Dependent Control
%Author: Devan Tormey
clear; clc; close all;
%The biggest change here is now we determine Kp and Kd based on some
%constraints we placed on the system as well as the face we know this to be
%a second order system


Inertia = eye(3);
qt = rand(4,1);
q0 = qt/norm(qt);
w0 = rand(3,1)

%choices for Kp and Kd depend on zeta and wn

z = 1; %Critically Damped
% z = .7 %Damped
% z = .1 %under damped



% wn is based on the assumption that our impulses are around this frequency
% A couple different choices for wn are dependant on what kinda stuff we
% think we need ot react to
wn = .017; %this corresponds to attenuating signals above 1 degree per second
% wn = .007 %assuming 60 degrees in 5 minutes

kd = 2*z*wn
kp = wn.^2

% 
% kd = 10
% kp = 1


sim('Attitude_Control.slx')
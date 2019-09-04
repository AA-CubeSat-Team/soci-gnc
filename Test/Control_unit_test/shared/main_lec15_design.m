% AA528 
%
% Frequency Domain Design Problem
clear variables; close all

% load constants
addpath('shared/')
constants

J  = diag([0.12,0.11,0.0346]);
dJ = 0.001;
s  = tf('s');

KP = zeros(3,3);
KD = zeros(3,3);
KI = zeros(3,3);

for axis = 1:3

% open loop response
Gp = 1/(J(axis,axis)*s*s);

% requirements
tr = 40;
Mp = 20;
ts = 60;
T = 1;
tau_d = 1e-6;

% try some closed loop poles
zeta    = 1.0;
wn      = 0.15; 
s_des   = -zeta*wn + wn*sqrt(zeta^2-1);

% check with a second-order system (approx these poles as dominant ones for
% a higher order system)
Gapprox = wn^2/(s*s + 2*zeta*wn*s + wn^2);
figure(1)
step(Gapprox);

%
Ti = 10; % 10
Td = 12;
Gc = (s+1/Td)*(s+1/Ti)/s;
Go = Gp*Gc;
figure(2)
rlocus(Go)

K = -1/(evalfr(Go,s_des));

Kp = K*(1/Td+1/Ti);
Kd = K;
Ki = K/(Td*Ti);
Gc = Kp + Kd*s + Ki/s;

Gce = Kp + Ki/s;
Gcd = Kd*s;
H = minreal(Gce*Gp/(1+(Gce+Gcd)*Gp));
figure(3)
step(H)

% check disturbance rejection with cnst disturbance
dist_2_output = minreal(Gp/(1+Gp*Gc)) * (tau_d);
figure(4)
step(dist_2_output)

% check changes in J
Jnew = J(axis,axis)+dJ;
Gp2  = 1/(Jnew*s*s);
Go2  = Gp2*Gc;
figure(5)
bode(Go,Go2)

KP(axis,axis) = Kp;
KD(axis,axis) = Kd;
KI(axis,axis) = Ki;

end

save('control_gains.mat','KP','KD','KI')

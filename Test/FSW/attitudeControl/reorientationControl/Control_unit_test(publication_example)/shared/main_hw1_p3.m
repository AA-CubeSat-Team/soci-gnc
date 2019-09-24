% AA528 HW1
%
% Design
clear variables; close all

% load constants
constants;

% problem parameters
r_a = 40000e3 + rE;
trueAnomaly = 45;
T = 43244;

% (a) 
inc = acos(1/sqrt(5)) * RAD2DEG;

% (b)
a = ((muE*T^2)/(4*pi^2))^(1/3);
n = sqrt(muE/a^3);  % mean motion
r_p = 2*a - r_a;
h_p = r_p - rE;     % altitude at perigee

% (c) 
e = (r_a - r_p) / (r_a + r_p);  % eccentricity

% (d) 
% true anomalies
theta_1 = 135 * DEG2RAD;    % enter 
theta_2 = 225 * DEG2RAD;    % leave

temp_1 = sqrt((1-e)/(1+e)) * tan(0.5*theta_1);
temp_2 = sqrt((1-e)/(1+e)) * tan(0.5*theta_2);

% eccentric anomalies
psi_1 = mod(2 * atan(temp_1),2*pi); % enter
psi_2 = mod(2 * atan(temp_2),2*pi); % leave

% time since perigee passage
t_tp_1 = (1/n)*(psi_1 - e*sin(psi_1));
t_tp_2 = (1/n)*(psi_2 - e*sin(psi_2));

% operational time
t_op = t_tp_2 - t_tp_1;
percent_op = t_op / T * 100;

% (f)
t_2_1 = (T-t_tp_2) + t_tp_1;


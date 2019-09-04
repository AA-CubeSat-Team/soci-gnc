% AA528 HW4
%
% Design
clear variables; close all

% load constants
addpath('Q_lib/')
constants

ang_bc  = pi/4;                     % camera offset angle
lat     = DEG2RAD * 47.659878;      % UW lattitude
lon     = DEG2RAD * -122.305968;    % UW longitude
t0      = 36000;                    % initial time
tf      = t0 + 60;                  % final maneuver time (min at 43s)
th_GMT_0 = wE * t0;                 % theta_{GMT} at initial time
th_GMT_f = wE * tf;                 % theta_{GMT} at final time

% final camera to topocentric at final time
C_CT_f = [ -1  0  0;
            0  1  0;
            0  0 -1 ];
      
% fixed body to camera
C_BC = rot_z(ang_bc);
     
% final rotation from inertial to topocentric frame
C_TI_f = rot_y(pi/2 - lat) * rot_z(th_GMT_f+lon);
     
% initial attitude quaternion
q_BI_0 = [ 0.0; 0.0; 0.0; 1.0 ];

% final desired attitude
C_BI_f = C_BC * C_CT_f * C_TI_f;
q_BI_f = my_dcm2quat_last(C_BI_f);

% error quaternion
q_err = Q_mult(Q_conj(q_BI_0),q_BI_f);

% axis and angle of rotation
qv_err  = q_err(1:3);
q4_err  = q_err(4);
ang_err = 2 * acos(q4_err);
vec_err = qv_err ./ (sin(ang_err/2));

% maneuver slew rate
w_rate  = ang_err / (tf - t0);
w_vec   = w_rate.*vec_err;

% simulate
[t,q] = ode45(@(t,q)Q_kinematics(t,q,w_vec),[0,tf-t0],q_BI_0);

% plot results
figure, hold on, grid on
plot(t,q)
plot((tf-t0),q_BI_f,'r*')
legend('q_1','q_2','q_3','q_4','Targets')
xlabel('Time [s]')
title('Quaternion Trajectory')

function C = rot_x(a)
    C = [ 1.0  0.0    0.0;
          0.0  cos(a) sin(a);
          0.0 -sin(a) cos(a) ];
end

function C = rot_y(a)
    C = [ cos(a) 0.0 -sin(a);
          0.0    1.0  0.0;
          sin(a) 0.0  cos(a) ];
end

function C = rot_z(a)
    C = [ cos(a) sin(a) 0.0;
         -sin(a) cos(a) 0.0;
          0.0    0.0    1.0 ];
end

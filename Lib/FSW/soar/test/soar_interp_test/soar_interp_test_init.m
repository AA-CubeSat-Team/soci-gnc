% Unit test file for SOAR interpolation library
%
% problem parameters defined in init_SOAR, all parameters in soar_params.
%
% T. Reynolds -- RAIN Lab

soar_params = fswParams.soar;

load('soar_test_data.mat')

% initial conditions
Jw       = simParams.actuators.rwa.inertia;
Aw       = simParams.actuators.rwa.A_wheel2body;
J        = simParams.scParams.J;
RPM2RPS  = fswParams.constants.convert.RPM2RPS;
ax       = [0.72756;0.027687;0.68549];
ax       = ax./norm(ax);
ang      = 68.667;
quat_ic  = xopt(1:4,1);% [ cosd(ang/2); sind(ang/2).*ax ]; %[0.92608;0.20851;-0.0048867;-0.31446];
w_ic     = J\xopt(5:7,1);%[0.00012082;0.00014607;0.021011]; 
hb_ic    = xopt(5:7,1);
Om0      = [ 905.63; -1062.5; 988.37; -992 ];    % initial wheel RPM
hw0      = Aw * Jw * (RPM2RPS * Om0);     % initial wheel momentum
hw_ic    = xopt(8:10,1);% [2.1259e-6;5.8341e-6;-8.6055e-7];%horzcat(eye(3),zeros(3,1)) * hw0;
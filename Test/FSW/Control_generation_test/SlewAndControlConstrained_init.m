% Initialization of the Slew rate and Control constrained controller
% Follows the design and methodology in "Feedback control logic for eigenaxis
% rotations under slew rate and control constraints"
%
%
% Author: Cole Morgan


controllers = struct;
controllers.J = simParams.scParams.J;

alpha = 45; % angle of the reaction wheels
A = [cosd(alpha) -cosd(alpha) cosd(alpha) -cosd(alpha);
    sind(alpha) 0 -sind(alpha) 0;
    0 -sind(alpha) 0 sind(alpha)];

A = A'*inv(A*A'); % psuedo inverse
controllers.A = A;


w_max = 6; %deg/sec
w_max = w_max*pi/180; % max slew rate in rad/sec
controllers.zeta = sqrt(2)/2;   % damping ratio
controllers.wn = 1;            % natural frequency

qd = [1;0;0;0];
qd = qd/norm(qd);     % desired quaternion. scalar first.
controllers.qd = qd;


q0 = [0.6157; 0.265; 0.265; -.6930];
q0 = q0/norm(q0);     % initial orientation
controllers.q0 = q0;


K = zeros(3, 3);
for i = 1:3
    K(i, i) = 2*controllers.zeta*controllers.wn*(abs(q0(i+1))/norm(q0(2:4)))*w_max*controllers.J(i, i);
end

controllers.K = K;
controllers.P = (2*(controllers.wn^2))*(K\controllers.J);
controllers.C = 2*controllers.zeta*controllers.wn*controllers.J;

controllers.saturation = 1; %saturate the value of Pq to +-1

% 2-norm is now hard coded in library for ease of normalization.
%controllers.norm = 2;     % 1-norm or 2-norm for the controller
                          %inf-norm will need str2num in the library.
                          % inf-norm or 2-norm probably most appropriate

controllers.w0 = [0; 0; 0]; % initial body rates for rest-to-rest reorientation




controllers.qd1 =[1;0;0;0];

fswParams.controllers = controllers;

clear controllers 
clear alpha A K w_max i q0 qd w0
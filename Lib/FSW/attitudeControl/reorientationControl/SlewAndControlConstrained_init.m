function [fswParams,simParams] = SlewAndControlConstrained_init(fswParams,simParams)
%SLEWANDCONTROLCONSTRAINED_INIT
%
% Initialization of the Slew rate and Control constrained controller
% Follows the design and methodology in "Feedback control logic for eigenaxis
% rotations under slew rate and control constraints"
%
% C. Morgan

reorientation   = struct;
reorientation.J = simParams.scParams.J;

% mappings from body torques to wheel torques
reorientation.A   = simParams.actuators.rwa.A_wheel2body;
reorientation.Phi = pinv(reorientation.A);
% reorientation.Phi = simParams.actuators.rwa.iAw(:,1:3);

% rad/sec max slew rate we chose arbitraily to reorient quickly but not 
% induce detumble mode detumble mode enters at 6 deg/s about any axis                           
reorientation.w_max      = 6 * fswParams.constants.convert.DEG2RAD;
reorientation.torque_max = 0.7*3.2*10^-3; % Nm -- 70% of max torque
reorientation.T          = (1/reorientation.torque_max).*eye(4);

reorientation.zeta = sqrt(2)/2;     % damping ratio
reorientation.wn   = 0.5;           % natural frequency

qd = [1;0;0;0];
qd = qd/norm(qd);                   % desired quaternion. scalar first.
reorientation.qd = qd;

q0 = [0.6157; 0.265; 0.265; -.6930];    % cannot be [1;0;0;0];
q0 = q0/norm(q0);                       % initial orientation
reorientation.q0 = q0;

% K is now determined inside controller library block.
K = zeros(3,3);
for i = 1:3
    K(i,i) = 2 * reorientation.zeta * reorientation.wn ...
               * (abs(q0(i+1))/norm(q0(2:4))) ...
               * reorientation.w_max * reorientation.J(i,i);
end
reorientation.K = K; 

reorientation.ep     = 0.001;   % use this to determine if K needs to be changed
reorientation.K_init = eye(3);  % will inevitably change
reorientation.P      = (2*(reorientation.wn^2))*(K\reorientation.J);
reorientation.C      = 2*reorientation.zeta*reorientation.wn*reorientation.J;

reorientation.saturation = 1; %saturate the value of Pq to +-1

%controllers.norm = 2;     % 1-norm or 2-norm for the controller
                          %inf-norm will need str2num in the library.
                          % inf-norm or 2-norm probably most appropriate
reorientation.w0  = [0; 0; 0]; % initial body rates for rest-to-rest reorientation
reorientation.qd1 = [1;0;0;0];

fswParams.controllers.reorientation = reorientation;

end
% File to select the gains for the reorientation controller
%
% T. P. Reynolds
clear;
init_params;
s = tf('s');

% this is the maximum capability about one axis should one wheel fail. 
u_max = cos(simParams.actuators.rwa.cant_angle) ...
            * simParams.actuators.rwa.max_torque_Nm;
% the maximum possible angle error that we'll use the reorientation
% controller for -- sun must be inside the FOV of the sun sensor, and our
% goal will be to align sun vector & sun sensor boresight.
e_max = deg2rad(simParams.sensors.sun_sensor.range_deg);
% the desired steady-state error
e_ss = deg2rad(1);
% maximum expected disturbance 
dist = 1e-7;

pdController = struct;
pdController.Kp = zeros(3,1);
pdController.Kd = zeros(3,1);
pdController.bw = zeros(3,1);

% design each axis to have the same damping ratio (not perfect SOS)
zeta = 0.8;
% compute the value of wn s.t. the proportional gain will not use more
% than u_max amount of torque for an error of e_max.
wn = 0.5 * sqrt(u_max/(e_max * max(diag(simParams.scParams.J))));

opts = bodeoptions;
opts.grid = 'on';
for k = 1:3
    % roughly the principal inertia about this axis
    J = simParams.scParams.J(k,k);
    % select control gains
    kp = wn^2 * J;
    kd = 2 * zeta * wn * J;
    % construct various transfer functions
    G = 1/(J*s^2);
    C = kp + kd * s;
    L = minreal(C*G);       % open-loop TF
    T = minreal(L/(1+L));   % complementary sensitivity
    S = minreal(1/(1+L));   % sensitivity function
    M = minreal(G*S);  % disturbance-to-output
    
    figure(1), clf
    hk = bodeplot(L,T,S,opts);
    legend('show')
    
    figure(2), clf
    h2 = stepplot(T);
    grid on
    h2.showCharacteristic('PeakResponse')
    h2.showCharacteristic('SettlingTime')
    legend('show')
    
    figure(3), clf
    h3opts = stepDataOptions('InputOffset',0,'StepAmplitude',dist);
    h3 = stepplot(M,h3opts);
    grid on
    h3.showCharacteristic('PeakResponse')
    h3.showCharacteristic('SteadyState')
    legend('show')
    
%     keyboard;
    
    pdController.bw(k) = bandwidth(T);
    pdController.Kp(k) = kp;
    pdController.Kd(k) = kd;  
end

% display approximate controller sample time
fprintf('Estimated controller sample time of %4.2f Hz\n',20*max(pdController.bw))

% save the gains in a mat file
save('../Include/pdController.mat','pdController')
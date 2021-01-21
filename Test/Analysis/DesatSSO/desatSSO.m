% Using some data obtained by the main sim, stored in B_eci_T, this script
% crunches some numbers to answer the questions:
%
%   (1) Can the MTQs be used to desaturate the wheels from their upper
%   limit in less than one orbit?
%   (2) Can the MTQs be used to fight off the disturbances (on average)?
%   (3) How much power is consumed by the wheels as they operate in this
%   scenario?
%
% Reference to <1 orbit is due to the length of the magnetic field data in
% B_eci_T. 
%
% TO DOs:
%   - Confirm power & max dipole numbers
%
% T. P. Reynolds
clearvars -except simParams fswParams

load('B_eci_T');
time_s = data{1}.Values.Time;
N      = numel(time_s);
% yes, the order is reversed. Check the game notes.
B_eci_T(1,:) = data{3}.Values.Data;
B_eci_T(2,:) = data{2}.Values.Data;
B_eci_T(3,:) = data{1}.Values.Data;

% parameters
dipole_max = fswParams.controllers.desaturation.maxDipole;  % Am2
A_w2b      = fswParams.allocator.A_wheel2body;
A_b2w      = pinv(A_w2b);
maxRPS     = simParams.actuators.rwa.max_RADPS;
RPS2RPM    = simParams.constants.convert.RPS2RPM;
Jw         = simParams.actuators.rwa.inertia;
mtq_m2P    = simParams.actuators.mtq.dipole_to_power;
disturb_Nm = 2e-8;  % average disturbance magnitude

% maximize the wheel spins in the nominal directions
nomRPS  = diag([1,1,-1,-1]) * simParams.initialConditions.rwa.radps; % rad/s
initRPS = 0.25 * maxRPS .* (nomRPS./norm(nomRPS,inf));               % rad/s

% compute required change in momentum
nomHw   = A_w2b * Jw * nomRPS;      % body, Nms
initHw  = A_w2b * Jw * initRPS;     % body, Nms
diffHw  = norm(initHw - nomHw);     % body, Nms

% control gain
gain         = diag([2e-6; 2e-6; 1e-6]);

% initial conditions
max_dpl_used = 0.0;
h_mtq        = zeros(1,N);
h_dist       = zeros(1,N);
h_wheel_Nms  = zeros(4,N);
h_wheel_Nms(:,1) = Jw * initRPS;
mtq_pwr_W    = zeros(1,N-1);
% Simulate. Becuase the time step on time_s is so small (should be 0.005s),
% it should be fine to use a very simple integration scheme here. Things
% aren't changing so fast that this will introduce a ton of error, I think.
for k = 1:N-1
    % wheel momentum error in the body frame
    h_body_Nms = A_w2b * h_wheel_Nms(:,k);
    h_err_Nms  = h_body_Nms - nomHw;
    % normal magnetic field vector
    b_body_unit = B_eci_T(:,k)./norm(B_eci_T(:,k));
    % dipole vector in body frame
    dipole_body = gain * (1./norm(B_eci_T(:,k))) * cross(h_err_Nms, b_body_unit);
    if max(abs(dipole_body))>max_dpl_used
        max_dpl_used = max(abs(dipole_body));
    end
    % MTQ power for this dipole
    mtq_pwr_W(k) = norm( mtq_m2P .* dipole_body ,1);
    % torque in body and wheel frame
    torque_body = - gain .* ( eye(3) - b_body_unit*b_body_unit' ) * h_err_Nms;
    % the wheels will need to counteract this torque to keep the s/c fixed,
    % so allocate this same torque into the wheel frame using the simple
    % min 2-norm formulation
    torque_wheel = A_b2w * torque_body;
    % "integrate" stuff
    dt = time_s(k+1) - time_s(k);
    h_dist(k+1)         = h_dist(k) + dt * disturb_Nm; 
    h_mtq(k+1)          = h_mtq(k)  + dt * norm(torque_body);
    h_wheel_Nms(:,k+1)  = h_wheel_Nms(:,k) + dt .* torque_wheel;
    if (h_mtq(k+1) > diffHw)
        fprintf('Finished at t = %06.2fs\n',time_s(k+1))
        % clip vectors for plotting
        time_s      = time_s(1:k+1);
        h_dist      = h_dist(1:k+1);
        h_mtq       = h_mtq(1:k+1);
        h_wheel_Nms = h_wheel_Nms(:,1:k+1);
        break;
    end
end
fprintf('Max dipole used: %03.3f Am2\n',max_dpl_used)

%% Plots

% plot magnetic field
figure(1), clf, hold on, grid on, box on
plot(time_s,1e6.*B_eci_T,'LineWidth',2)
xlabel('Time [s]','FontSize',15,'Interpreter','latex')
ylabel('Magnetic Field [uT]','FontSize',15,'Interpreter','latex')

% plot power consumption
figure(2), clf, hold on, grid on, box on
plot(time_s(1:end-1),1e3.*mtq_pwr_W,'LineWidth',2)
xlabel('Time [s]','FontSize',15,'Interpreter','latex')
ylabel('MTQ Power [mW]','FontSize',15,'Interpreter','latex')

% plot momenta
figure(3), clf
subplot(2,1,1), hold on, grid on, box on
plot(time_s,1e3.*h_mtq,'LineWidth',2)
plot(time_s,1e3.*h_dist,'LineWidth',2)
legend('MTQ','Disturbances','Interpreter','latex','FontSize',14,...
        'location','northwest')
xlabel('Time [s]','FontSize',15,'Interpreter','latex')
ylabel('Momentum [mNms]','FontSize',15,'Interpreter','latex')
subplot(2,1,2), hold on, grid on, box on
plot(time_s,RPS2RPM.*(Jw\h_wheel_Nms),'LineWidth',2)
xlabel('Time [s]','FontSize',15,'Interpreter','latex')
ylabel('Wheel RPM','FontSize',15,'Interpreter','latex')
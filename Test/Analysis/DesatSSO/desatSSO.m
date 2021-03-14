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
% Some nomenclature: variables are named with a convention of
%               <symbol>_<identifier>_<frame>_<units>
% where,
%   <symbol> is something like 'O' for spin rates (Omega), 'h' for momentum
%   <identifier> is something like 'init' for initial, 'nom' for nominal,
%   or 'diff' for difference
%   <frame> is the coordinate frame that the variable is resolved in, like
%   'eci' for Earth-Centered Inertial, 'body' for body frame, etc.
%   <units> gives the units, following SI standards.
%
% TO DOs:
%   - Confirm power & max dipole numbers
%
% T. P. Reynolds
clearvars -except simParams fswParams

load('B_eci_T');
time_s = data{1}.Values.Time;
N      = numel(time_s);
% yes, the order is reversed. Check the game notes. B stands for magnetic
% field vector. 
B_eci_T(1,:) = data{3}.Values.Data;
B_eci_T(2,:) = data{2}.Values.Data;
B_eci_T(3,:) = data{1}.Values.Data;

% parameters
dipole_max = fswParams.controllers.desaturation.maxDipole;  % Am2

% A_w2b is the matrix that maps between wheel-frame momentum (4 dim) and
% body-frame momentum (3 dim). If the wheels are spinning with momenta
% h_wheel \in \real^4, then this produces a body-frame momentum vector of
% h_body = A_w2b * h_wheel \in \real^3. 
A_wheel2body = fswParams.allocator.A_wheel2body;
A_body2wheel = pinv(A_wheel2body);

% maxRPS is the max spin rate in radians per second.
maxRPS     = simParams.actuators.rwa.max_RADPS;
RPS2RPM    = simParams.constants.convert.RPS2RPM;
J_w_wheel_kgm2 = simParams.actuators.rwa.inertia;   % individual wheel inertia
mtq_m2P    = simParams.actuators.mtq.dipole_to_power;

% average disturbance magnitude (estimated, pending more detailed analysis)
T_disturb_body_Nm = 2e-8;  

% choose nominal (desired) wheel spin rates
O_nom_radps  = diag([1,1,-1,-1]) * simParams.initialConditions.rwa.radps;
% choose initial spin rates for analysis
O_init_radps = 0.25 * maxRPS .* (O_nom_radps./norm(O_nom_radps,inf));   

% compute required change in momentum to go from initial to nominal spin rates
h_w_nom_body_Nms   = A_wheel2body * J_w_wheel_kgm2 * O_nom_radps;   
h_w_init_body_Nms  = A_wheel2body * J_w_wheel_kgm2 * O_init_radps; 
h_w_diff_body_Nms  = norm(h_w_init_body_Nms - h_w_nom_body_Nms);    

% desat controller gain, estimated
gain         = diag([2e-5; 2e-5; 1e-5]);

% initial conditions
max_dpl_used = 0.0;
h_mtq_body_Nms        = zeros(1,N);
h_dist_body_Nms       = zeros(1,N);
h_wheel_Nms           = zeros(4,N);
h_wheel_Nms(:,1)      = J_w_wheel_kgm2 * O_init_radps;
mtq_pwr_W             = zeros(1,N-1);

% Simulate. Becuase the time step on time_s is so small (should be 0.005s),
% it should be fine to use a very simple integration scheme here. Things
% aren't changing so fast that this will introduce a ton of error, I think.
%
% Equations being "integrated" here are
%   (1)  \dot{h_dist}      = disturb_Nm           
%   (2)  \dot{h_mtq}       = norm(torque_body)    
%   (3)  \dot{h_wheel_Nms} = torque_wheel
%
% where,
%
%   (1) is the net momentum that enters the system from disturbance torques
%   (2) is the net momentum applied to the system by the MTQs as they
%   attempt to desat the wheels & compensate for the disturbances
%   (3) is the momentum of the spinning wheels, equivalent to their RPM
%   under a change of units.

for k = 1:N-1
    % wheel momentum error in the body frame
    h_w_body_Nms    = A_wheel2body * h_wheel_Nms(:,k);
    h_err_body_Nms  = h_w_body_Nms - h_w_nom_body_Nms;
    
    % normal magnetic field vector *ignoring attitude here for low-fi sim*
    B_body_unit = B_eci_T(:,k)./norm(B_eci_T(:,k));
    
    % dipole vector in body frame (use m for dipole)
    m_mtq_body_Am2 = gain * (1./norm(B_eci_T(:,k))) * cross(h_err_body_Nms, B_body_unit);
    if max(abs(m_mtq_body_Am2))>max_dpl_used
        max_dpl_used = max(abs(m_mtq_body_Am2));
    end
    
    % MTQ power for this dipole
    mtq_pwr_W(k) = norm( mtq_m2P .* m_mtq_body_Am2 ,1);
    
    % torque in body and wheel frame. This is a representation of the
    % control law that you'll want to use in the desat controller itself.
    torque_req_body_Nm = - gain .* ( eye(3) - B_body_unit*B_body_unit' ) * h_err_body_Nms;
    
    % the wheels will need to counteract this torque to keep the s/c fixed,
    % so allocate this same torque into the wheel frame using the simple
    % min 2-norm formulation (note: this is *not* the allocation strategy
    % used in FSW, but good enough for this low-fi sim)
    torque_req_wheel_Nm = A_body2wheel * torque_req_body_Nm;
    
    % "integrate" stuff
    dt                   = time_s(k+1) - time_s(k);
    h_dist_body_Nms(k+1) = h_dist_body_Nms(k) + dt * T_disturb_body_Nm; 
    h_mtq_body_Nms(k+1)  = h_mtq_body_Nms(k)  + dt * norm(torque_req_body_Nm);
    h_wheel_Nms(:,k+1)   = h_wheel_Nms(:,k) + dt .* torque_req_wheel_Nm;
    
    % this stops the sim if the amount of momentum provided by the MTQs
    % exceeds the initial momentum difference between the desired wheel
    % momentum & the initial wheel momentum
    if (h_mtq_body_Nms(k+1) > h_w_diff_body_Nms)
        fprintf('Finished at t = %06.2fs\n',time_s(k+1))
        % clip vectors for plotting
        time_s          = time_s(1:k+1);
        h_dist_body_Nms = h_dist_body_Nms(1:k+1);
        h_mtq_body_Nms  = h_mtq_body_Nms(1:k+1);
        h_wheel_Nms     = h_wheel_Nms(:,1:k+1);
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
plot(time_s,1e3.*h_mtq_body_Nms,'LineWidth',2)
plot(time_s,1e3.*h_dist_body_Nms,'LineWidth',2)
legend('MTQ','Disturbances','Interpreter','latex','FontSize',14,...
        'location','northwest')
xlabel('Time [s]','FontSize',15,'Interpreter','latex')
ylabel('Momentum [mNms]','FontSize',15,'Interpreter','latex')
subplot(2,1,2), hold on, grid on, box on
plot(time_s,RPS2RPM.*(J_w_wheel_kgm2\h_wheel_Nms),'LineWidth',2)
xlabel('Time [s]','FontSize',15,'Interpreter','latex')
ylabel('Wheel RPM','FontSize',15,'Interpreter','latex')
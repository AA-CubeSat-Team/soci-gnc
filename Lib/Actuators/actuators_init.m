actuators = struct;
actuators.sample_time_s = simParams.sample_time_s;

% Reaction Wheel Assembly (RWA)
rwa = struct;

rwa.voltage = 5; % 5 volts in
rwa.Rm = 1; % 1 Ohm resistance
rwa.Kv = .016; %V/rad/s back EMF
rwa.Km = .016; %Nm/A torque constant
rwa.Iw = (1/2)*2*.15^2 + 10^-6; %kg-m^2 based on inertia of a disk about z axis + inertia of motor.
rwa.Is = (1/12)*4*(.3^2 + .1^2);
% Iw = 10;
% Is = 1;
rwa.B = 1; %Nm/(rad/s) viscous damping
rwa.current_limit = 5; %amps
rwa.voltage_limit = 24; %Volts

% estimated from spec sheet using:
% cvx_begin sdp
%     variable J(4,4) diagonal
%     variable g1 nonnegative
%     variable g2 nonnegative
%     minimize( g1 + g2 )
%     norm(hw1-A*J*O1) <= g1;
%     norm(hw2-A*J*O2) <= g2;
% cvx_end
rwa.inertia = 2.9526e-5 * eye(4);

actuators.rwa = rwa;

% Magnetorquers (MTQ)
mtq = struct;

% body frame normal vectors of each mtq coil
mtq.normals = [  1, 0, 0;
                -1, 0, 0;
                 0, 1, 0;
                 0,-1, 0;
                 0, 0, 1 ];
             
% get the number of coils contributing to control about each body face, 
% and the indices of the corresponding coil normal vectors in mtq.normals 
mtq.n_coils = [ sum(abs(mtq.normals(:,1))); ...
                sum(abs(mtq.normals(:,2))); 
                sum(abs(mtq.normals(:,3))) ];
mtq.id_x  = find(mtq.normals(:,1));
mtq.id_y  = find(mtq.normals(:,2));
mtq.id_z  = find(mtq.normals(:,3));

% max dipoles
mtq.dipoles_Am2    = 0.5*[0.0515;0.0515;0.131];           % per individual coil
mtq.dipole_max_Am2 = mtq.dipoles_Am2;% diag(mtq.n_coils) * mtq.dipoles_Am2;      % axes total

% electric characteristics (per coil)
mtq.voltage     = [5;5;3.3];                        % V
mtq.max_current = [0.216;0.216;0.078];              % A
mtq.P_max_W     = mtq.voltage .* mtq.max_current;   % W [0.4;0.4;0.4] ?

% digital value to drive each coil [0 mtq.dig_val] <=> [0 m_max]
mtq.dig_val = 100;

% ratios to map dipole to power (per coil)
mtq.dipole_to_power = mtq.P_max_W./mtq.dipoles_Am2;

% add mtq to actuators struct
actuators.mtq = mtq;

% add actuators struct to both fsw and sim params
simParams.actuators = actuators; 
fswParams.actuators = actuators;

clear rwa mtq
clear actuators;
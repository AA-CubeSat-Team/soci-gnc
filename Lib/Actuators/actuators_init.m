actuators = struct;

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

actuators.rwa = rwa;

% Magnetorquers (MTQ)
mtq = struct;

mtq.max_dipole_x  = 0.0515; 
mtq.max_dipole_y  = 0.0515; 
mtq.max_dipole_z  = 0.131; 
mtq.current_A_xy  = 0.216;
mtq.current_A_z   = 0.078;
mtq.voltage_V_xy  = 5;
mtq.voltage_V_z   = 3.3;

actuators.mtq = mtq;

simParams.actuators = actuators; 
fswParams.actuators = actuators;

clear rwa mtq
clear actuators;
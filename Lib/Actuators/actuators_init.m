
actuators = struct;
actuators.sample_time_s = 0.1;

simParams.actuators = actuators;

CMG = struct;

CMG.voltage = 5; % 5 volts in
CMG.Rm = 1; % 1 Ohm resistance
CMG.Kv = .016; %V/rad/s back EMF
CMG.Km = .016; %Nm/A torque constant
CMG.Iw = (1/2)*2*.15^2 + 10^-6; %kg-m^2 based on inertia of a disk about z axis + inertia of motor.
CMG.Is = (1/12)*4*(.3^2 + .1^2);
% Iw = 10;
% Is = 1;
CMG.B = 1; %Nm/(rad/s) viscous damping
CMG.current_limit = 5; %amps
CMG.voltage_limit = 24; %Volts

simParams.CMG = CMG; 


clear CMG
clear actuators;
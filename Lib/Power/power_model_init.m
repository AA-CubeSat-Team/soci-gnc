function [fswParams,simParams] = power_model_init(fswParams,simParams)
%POWER_MODEL_INIT
%
% Initialization of power model parameters
%
% Nick Melville

power = struct;

power.radio_tx_W = 2.9;
power.radio_rx_W = 0.45;
power.cdh_W = 0.398;
power.img_active_W = 0.515;
power.img_idle_W = 0.025;
power.sensors_w = 0.104;
power.eps_system_W = 0.4;

power.sp_eff = 0.9;
power.eff = 0.85;

power.batt_capacity = 74592; % Joules
power.init_dod = 0.9;

simParams.power = power;


end
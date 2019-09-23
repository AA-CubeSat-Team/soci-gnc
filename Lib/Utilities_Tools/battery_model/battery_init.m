batt = struct;

% Battery characteristics
batt.capacity_Wh = 30;
batt.dod_min     = 80;

% initial conditions
batt.ic.capacity_Wh = batt.capacity_Wh;

% COM power
batt.com.rx_power_W = 0.450;
batt.com.tx_beacon_power_W = (2.900 - batt.com.rx_power_W);
batt.com.tx_main_power_W = (5.400 - batt.com.rx_power_W);
batt.com.beacon_period_s  = 60;
batt.com.beacon_length_s  = 3;
batt.com.beacon_length_pct = ...
                 100 * (batt.com.beacon_length_s/batt.com.beacon_period_s);

% IMG power
batt.img.idle_power_W = 0.01;   % sleep/idle mode power
batt.img.opr_power_W  = 0.45;   % operating power

% CDH power
batt.cdh.max_power_W = 0.496;
batt.cdh.mid_power_W = 0.250;   % WAG
batt.cdh.low_power_W = 0.075;   % WAG

% EPS power
batt.eps.opr_power_W = 0.400;

% Efficiencies
batt.eps.eff_5v     = (1/0.925);
batt.eps.eff_3v3    = (1/0.85);

simParams.batt = batt;
clear batt;
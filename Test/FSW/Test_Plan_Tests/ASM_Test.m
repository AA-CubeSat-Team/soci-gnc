% Detumble test

% Run Sim_init if you haven't already
% Sim_init

% Sets the initial body rotation rate to two times the threshold for
% attitude stabilization mode. 
simParams.initialConditions.w_body_radps = 2*[1;1;1]*fswParams.mode_select.body_rate_threshold_max;

sim('Main_Sim', 'StartTime','0','StopTime','30');

figure(1)
subplot(2,1,1)
plot(gnc_mode.Time,gnc_mode.Data,'LineWidth',3')
title('SOC-I Attitude Stabilization Mode')
ylabel('GNC Mode')

subplot(2,1,2)
plot(sc_body_rates_radps.Time,sc_body_rates_radps.Data,'LineWidth',2')
xlabel('Time (s)')
ylabel('Body Rates (rad/s)')
legend('x','y','z')

% Imaging Test

% Run Sim_init if you haven't already
% Sim_init

% For this test to work, you must change the target lat, long, and alt to
% 60,120,0.

sim('Main_Sim', 'StartTime','0','StopTime','500');

figure(1)
subplot(2,1,1)
plot(gnc_mode.Time,gnc_mode.Data,'LineWidth',3')
title('SOC-I Imaging Mode')
ylabel('GNC Mode')

subplot(2,1,2)
plot(ace_err.Time,ace_err.Data,'LineWidth',2')
xlabel('Time (s)')
ylabel('Error Between Commanded and Actual Attitude (degrees)')
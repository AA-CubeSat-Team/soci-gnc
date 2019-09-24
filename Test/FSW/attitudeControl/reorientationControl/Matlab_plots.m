clc; close all;

sim('SlewAndControlConstrained_Controller_unit_test.slx')

figure()
plot(simout.Time, simout.Data)
xlabel('Time [sec]')
ylabel('Attitude')
title('Attitude vs. time')
legend('q_1', 'q_2', 'q_3', 'q_4')
% print(fig1,'Attitude','-dpng')

figure()
plot(simout1.Time, simout1.Data)
xlabel('Time [sec]')
ylabel('Body Rates [rad/s]')
title('Body rates vs. time')
legend('\omega_1', '\omega_2', '\omega_3')

figure()
plot(simout2.Time, simout2.Data)
xlabel('Time [sec]')
ylabel('Slew-rate [deg/s]')
title('Total slew-rate vs. time')
% legend('\omega_1', '\omega_2', '\omega_3')

figure()
plot(simout3.Time, simout3.Data)
xlabel('Time [sec]')
ylabel('Torque commands [Nm]')
title('Commanded torque vs. time')
legend('\tau_1', '\tau_2', '\tau_3')

figure()
plot(simout4.Time, simout4.Data)
xlabel('Time [sec]')
ylabel('Wheel torques [Nm]')
title('Reaction wheel torques vs. time')
legend('\tau_{wheel-1}', '\tau_{wheel-2}', '\tau_{wheel-3}', '\tau_{wheel-4}')


clc
close all
clearvars -except fswParams simParams TLE
%tag
tfinal = 5600;
omega_test = [0.1;0.05;-0.07];
w1 = mat2str([omega_test]);

set_param( 'UnitTestDebug/omega_true', 'Value',w1) %set model angular velocity (constant)
set_param( 'UnitTestDebug/Add Bias/gyroscope_lib/ARW', 'Gain','10*1e-5') %set model angle random walk
set_param( 'UnitTestDebug/Add Bias/gyroscope_lib/RRW', 'Gain','10*1e-5') %set model rate random walk
sim('UnitTestDebug',tfinal)

%extract values from sim
qtrue = my_qtrue.signals.values;
qest = my_qest.signals.values;
quat_error = quat_theta_error_deg.signals.values;
om_true = omega_true.signals.values;
om_est = omega_est.signals.values;
bias = bias.signals.values;

%extract angular velos
for j = 1:3
angular_velo_true(j,:) = om_true(j,1,:);
angular_velo_est(j,:) = om_est(j,1,:);
end

%%%plot Quaternion error for theta angle
figure
plot(tout, quat_error)
title('Quaternion Error in degrees (theta angle)')
ylabel('Error (deg)')
xlabel('Time (s)')
grid on

%%%plot of quaternions estimates vs true values
figure;
for i = 1:4
grid on;
subplot(2,2,i)
title('Quaternion Estimates')
hold on
plot(tout,qtrue(:,i),'k','Linewidth',1.25)
plot(tout,qest(:,i),'m--','Linewidth',1.25)
legend(['q_',num2str(i),  'true'],[ 'q_',num2str(i),  'est'])
grid on;
xlabel('Time (s)')
ylabel('Quat Value (rad)')
hold off
end


%%%plot angular velocities
g = ['x';'y';'z'];
figure;
for i = 1:3
grid on;
subplot(3,1,i)
title('Angular Velocity Estimates')
hold on
plot(tout,angular_velo_true(i,:),'k','Linewidth',1.25)
plot(tout,angular_velo_est(i,:),'m--','Linewidth',1.25)
legend(['\omega_',g(i),  'true'],[ '\omega_',g(i),  'est'])
grid on;
xlabel('Time (s)')
ylabel('\omega Value (rad/s)')
hold off
end

%%%plot Bias

figure;
for i = 1:3
grid on;
subplot(3,1,i)
title('Estimated Bias')
hold on
plot(tout,bias(i,:),'k','Linewidth',1.25)
legend(['bias_',g(i)])
grid on;
xlabel('Time (s)')
ylabel('bias Value ')
hold off
end

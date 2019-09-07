% Disturbance Plot
% Plots the disturbances as a function of time
% Author: Devan Tormey


figure()
hold all
plot(tout,dist_torque_Nm.Data(:,1))
plot(tout,dist_torque_Nm.Data(:,2))
plot(tout,dist_torque_Nm.Data(:,3))
legend('T_{dx}','T_{dy}','T_{dz}')
xlabel('Time [s]')
ylabel('Torque [Nm]')
title('Disturbance Torques')

figure()
hold all
plot(tout,b_eci.Data(:,1))
plot(tout,b_eci.Data(:,2))
plot(tout,b_eci.Data(:,3))
legend('b_{x}','b_{y}','b_{z}')
xlabel('Time [s]')
ylabel('B-Field')
title('Magnetic Field Vector')




%% plotting my estimated vs my true
close all
figure; 

grid on;
subplot(2,2,1)
title('constant \omega = [-0.1;0.2;0.12]')
hold on
plot(tout,my_qtrue.Data(:,1),'k','Linewidth',1.5)
plot(tout,my_qest.Data(:,1),'m--','Linewidth',1.5)
legend('q1 true', 'q1 est')
grid on;
hold off

subplot(2,2,2)
hold on
plot(tout,my_qtrue.Data(:,2),'k','Linewidth',1.5)
plot(tout,my_qest.Data(:,2),'m--','Linewidth',1.5)
legend('q2 true', 'q2 est')
grid on;
hold off

subplot(2,2,3)
hold on
plot(tout,my_qtrue.Data(:,3),'k','Linewidth',1.5)
plot(tout,my_qest.Data(:,3),'m--','Linewidth',1.5)
legend('q3 true', 'q3 est')
grid on;
hold off

subplot(2,2,4)
hold on
plot(tout,my_qtrue.Data(:,4),'k','Linewidth',1.5)
plot(tout,my_qest.Data(:,4)','m--','Linewidth',1.5)
legend('q4 true', 'q4 est')
grid on;
hold off
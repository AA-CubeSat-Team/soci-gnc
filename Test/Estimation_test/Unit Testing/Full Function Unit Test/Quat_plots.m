



%% plotting my estimated vs my true
close all
figure; grid on;
subplot(2,2,1)
hold on
plot(tout,my_qtrue.Data(:,1),'k')
plot(tout,my_qest.Data(:,1),'g--')
legend('q1 true', 'q1 est')
grid on;
hold off

subplot(2,2,2)
hold on
plot(tout,my_qtrue.Data(:,2),'k')
plot(tout,my_qest.Data(:,2),'g--')
legend('q2 true', 'q2 est')
grid on;
hold off

subplot(2,2,3)
hold on
plot(tout,my_qtrue.Data(:,3),'k')
plot(tout,my_qest.Data(:,3),'g--')
legend('q3 true', 'q3 est')
grid on;
hold off

subplot(2,2,4)
hold on
plot(tout,my_qtrue.Data(:,4),'k')
plot(tout,my_qest.Data(:,4)','g--')
legend('q4 true', 'q4 est')
grid on;
hold off
clc;


figure()
subplot(1,2,1)
hold all;
plot(tout,q_body.Data(:,1))
plot(tout,q_body.Data(:,2))
plot(tout,q_body.Data(:,3))
plot(tout,q_body.Data(:,4))
title('q_{actual}')
xlim([tout(1) tout(end)])
ylim([-1 1])
grid on

subplot(1,2,2)
hold all;
plot(tout,qHat_body.Data(:,1))
plot(tout,qHat_body.Data(:,2))
plot(tout,qHat_body.Data(:,3))
plot(tout,qHat_body.Data(:,4))
xlim([tout(1) tout(end)])
ylim([-1 1])
title('q_{estimate}')
grid on

clc;


figure()
subplot(1,2,1)
hold all;
plot(tout,q_body.Data(:,1))
plot(tout,q_body.Data(:,2))
plot(tout,q_body.Data(:,3))
plot(tout,q_body.Data(:,4))
title('q_actual')

subplot(1,2,2)
hold all;
plot(tout,qHat_body.Data(:,1))
plot(tout,qHat_body.Data(:,2))
plot(tout,qHat_body.Data(:,3))
plot(tout,qHat_body.Data(:,4))
title('q_hat')

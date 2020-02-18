%%
Sim_init;

sim('Main_Sim.slx')

%% 
close all
q_estimate = q_est.Data(:,:);

q_truth= q_true.Data(:,:);

figure()
subplot(2,2,1)
hold all;
plot(tout,q_estimate(:,1))
plot(tout,q_truth(:,1))
legend('Estimate','Truth')
title('q0')
ylim([-1,1])

subplot(2,2,2)
hold all;
plot(tout,q_estimate(:,2))
plot(tout,q_truth(:,2))
title('q1')
ylim([-1,1])

subplot(2,2,3)
hold all;
plot(tout,q_estimate(:,3))
plot(tout,q_truth(:,3))
title('q2')
ylim([-1,1])

subplot(2,2,4)
hold all;
plot(tout,q_estimate(:,4))
plot(tout,q_truth(:,4))
title('q3')
ylim([-1,1])
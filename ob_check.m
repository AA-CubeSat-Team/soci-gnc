


close all
for i = 1:length(tout)
ob = obsv(Phi_sim.signals.values(:,:,i),H_sim.signals.values(:,:,i));
meas_att(:,i) = meas_attitude.signals.values(:,:,i);
rank_ob(:,i) = rank(ob);
end
figure
plot(tout,rank_ob)


figure
plot(tout,meas_att(1,:),tout,my_attitude.signals.values(:,1),tout,true_attitude.signals.values(:,1))
legend('measured attitude','my attitude')
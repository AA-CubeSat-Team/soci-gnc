%%
Sim_init;

sim('Main_Sim.slx')


%%
%  close all
q_estimate = q_est.Data(:,:);

q_truth= q_true.Data(:,:);

tout_e = tout;


figure()
subplot(2,2,1)
plot(tout_e,q_estimate(1,:),tout,q_truth(:,1),'k')
title('estimate q0')
legend('estimated','truth')
title('truth q0')
ylim([-1 1])

subplot(2,2,2)
plot(tout_e,q_estimate(2,:),tout,q_truth(:,2),'k')
title('estimate q1')
legend('estimated','truth')
ylim([-1 1])

subplot(2,2,3)
plot(tout_e,q_estimate(3,:),tout,q_truth(:,3),'k')
legend('estimated','truth')
title('estimate q2')
ylim([-1 1])

subplot(2,2,4)
plot(tout_e,q_estimate(4,:),tout,q_truth(:,4),'k')
title('estimate q3')
legend('estimated','truth')
ylim([-1 1])


%%
% eul_est(k,:) = 
%   eul_est(k,:) = 
for k=1:length(tout)
   eul_est(:,k) = quat2eul(q_estimate(:,k)');
   eul_truth(:,k) = quat2eul(q_truth(k,:));
   eul_error(k) = dot(eul_truth(:,k),eul_est(:,k));
   if bool.Data(k,1) < .5
       findBad(k,1) = tout(k);
       findBad(k,2) = eul_error(k);
   end
end

%%
close all;

figure()
subplot(1,3,1)
hold all
plot(tout_e,eul_est(1,:))
plot(tout,eul_truth(1,:),'k')
title('estimate q0')
legend('estimated','truth')
title('truth q0')
% ylim([-1 1])


subplot(1,3,2)
hold all
plot(tout_e,eul_est(2,:))
plot(tout,eul_truth(2,:),'k')
title('estimate q0')
legend('estimated','truth')
title('truth q0')

subplot(1,3,3)
hold all
plot(tout_e,eul_est(3,:))
plot(tout,eul_truth(3,:),'k')
title('estimate q0')
legend('estimated','truth')
title('truth q0')

figure()
hold all
plot(tout,eul_error)
plot(findBad(:,1),findBad(:,2),'r*')
title('Error in Euler Angle [Dot Product]')

figure()
hold all
plot(tout,bool.Data(:,1))
title('sun boolean')


figure()
hold all
plot(tout,bool.Data(:,2))
title('mag boolean')


figure()
hold all
plot(tout,bool.Data(:,3))
title('Gyro Boolean')




%% 
% close all
% q_estimate = q_est.Data(:,:);
% 
% q_truth= q_true.Data(:,:);
% 
% figure()
% subplot(2,2,1)
% hold all;
% plot(tout,q_estimate(:,1))
% plot(tout,q_truth(:,1))
% legend('Estimate','Truth')
% title('q0')
% ylim([-1,1])
% 
% subplot(2,2,2)
% hold all;
% plot(tout,q_estimate(:,2))
% plot(tout,q_truth(:,2))
% title('q1')
% ylim([-1,1])
% 
% subplot(2,2,3)
% hold all;
% plot(tout,q_estimate(:,3))
% plot(tout,q_truth(:,3))
% title('q2')
% ylim([-1,1])
% 
% subplot(2,2,4)
% hold all;
% plot(tout,q_estimate(:,4))
% plot(tout,q_truth(:,4))
% title('q3')
% ylim([-1,1])
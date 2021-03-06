
%Author: Kylle Ashton 5/29/2020
%Title: simulation plots
%Description:% Plots Estimated Output Values of MEKF Simulation

clc
close all
tfinal = 20000;
t = 0:fswParams.sample_time_s:tfinal;
qest = my_qest.Data';
qtrue = q_true.Data';
% bias = reshape(bias_out.signals.values,3,length(t))';
bias = bias_out.Data';
omega_est1 = omega_est.Data'; %reshape(omega_est.signals.values,3,length(t))';
for i =1:length(t)
 qmix1 = [qest(4,i);qest(1,i);qest(2,i);qest(3,i)]';
                qmix = ([qest(4,i);-qest(1,i);-qest(2,i);-qest(3,i)]');
                    qmix_true = ([qtrue(4,i);qtrue(1,i);qtrue(2,i);qtrue(3,i)]');
                        qm(i,:) = 2*quat_err(qmix1,qmix_true);
%                             qerr = qm(:,1:3)*2; % error quaternion as a vector
% qerr(:,i) = acos(qm(i,4))*2*180/pi;


end

set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex')
Purple = [51;0;111]/norm([51;0;111]);
   Gold = [145 123 76]'/norm([145 123 76]');
qleg = {'q_0,','q_1','q_2','q_3'};
   figure;
for j = 1:4
grid on;
subplot(2,2,j)
hold on
plot(t,q_true.Data(:,j),'color',Purple,'Linewidth',1.25);
% title(['                            Quaternion Estimates, constant \omega =',mat2str(norm(omega_val,2)), 'rad/s'])
p = plot(t,my_qest.Data(:,j),'color',Gold,'Linewidth',1.5)
legend(['q_',num2str(j),' true'], [qleg{j}, ' est'],'Location','Best')
p.LineStyle = '--';
xlabel('Time (hours)')
% xlim([5745,20000])
 xt = round([0:(tfinal/3600)/6:tfinal/3600],2);
    xt(end) = tfinal/3600;
set(gca,'XTick',0:tfinal/6:tfinal)
set(gca,'XTickLabel',xt)
grid on;
hold off
end
%  omega_val= get_param( 'my_sim/satelliteDynamics_lib/RigidBodyDynamics/wint', 'InitialCondition')*180/pi ;


 figure;
for j = 1:4
grid on;
subplot(4,1,j)
hold on
if j ==1
%    h1 = plot(t,q_err.Data(:,j),'color',Purple,'Linewidth',1.25)
   h1 = plot(t,q_err.Data(:,j),'color',Purple,'Linewidth',1.25)
    legend(h1,['AKE error']);
    title('Attitude Knowledge Error')
    ylabel('Error (deg)')
 xlabel('Time (hours)')
% xlim([5745,20000])
ylim([0,3.5])
      xt = round([0:(tfinal/3600)/11:tfinal/3600],2);
    xt(end) = tfinal/3600;
set(gca,'XTick',0:tfinal/11:tfinal)
set(gca,'XTickLabel',xt)
else
plot(t,three_sig.Data(:,j-1),'color',Gold,'Linewidth',1.25)
h = plot(t,2*vec_err.Data(:,j-1),'color',Purple,'Linewidth',1.25);
plot(t,-three_sig.Data(:,j-1),'color',Gold,'Linewidth',1.25)
legend(h,[qleg{j},' error']);
title([qleg{j},' error and 3 \sigma Bounds']) 
ylabel('Error (deg)')
 xlabel('Time (hours)')
xlim([5745,20000])
% ylim([-0.1,0.1])
      xt = round([0:(tfinal/3600)/11:tfinal/3600],2);
    xt(end) = tfinal/3600;
set(gca,'XTick',0:tfinal/11:tfinal)
set(gca,'XTickLabel',xt)
grid on;
hold off
end
end

% omeg_err = omega_est1-wtrue.Data';
% for k = 1:length(t)
%     om_nerr(k) = norm(omeg_err(:,k),2);
% end
% ax1 = {'\omega_x','\omega_y','\omega_z'};
%  figure;
% for j = 1:4
% grid on;
% subplot(4,1,j)
% hold on
% if j<4
%  plot(t,omega_est1(j,:),'color',Purple,'Linewidth',1.1)
%  plot(t,wtrue.Data(:,j)','color',Gold,'Linewidth',1.1)
% legend(['q_',num2str(j),' error'],'\omega true');
% title(['Estimated ',ax1{j}]) 
% ylabel('Value (deg/s)')
%  xlabel('Time (hours)')
%  xt = round([0:(tfinal/3600)/11:tfinal/3600],2);
%     xt(end) = tfinal/3600;
% set(gca,'XTick',0:tfinal/11:tfinal)
% set(gca,'XTickLabel',xt)
% else 
%     g1 = plot(t,om_nerr(j),'color',Purple,'Linewidth',1.1)
% legend(g1,['q_',num2str(j),' error']);
% % title(['Estimated ',ax1{j}]) 
% ylabel('Value (deg/s)')
%  xlabel('Time (hours)')
%  xt = round([0:(tfinal/3600)/11:tfinal/3600],2);
%     xt(end) = tfinal/3600;
% set(gca,'XTick',0:tfinal/11:tfinal)
% set(gca,'XTickLabel',xt)
% grid on;
% hold off
% end
% end


ax = {'\beta_x','\beta_y','\beta_z'};
 figure;
for j = 1:3
grid on;
subplot(3,1,j)
hold on
plot(t,bias(j,:),'color',Purple,'Linewidth',1.1)
% legend(h,['q_',num2str(j),' error']);
title([ax{j},' Value']) 
ylabel('Bias (deg/s)')
 xlabel('Time (hours)')
 xlim([5745,20000])
 xt = round([0:(tfinal/3600)/11:tfinal/3600],2);
    xt(end) = tfinal/3600;
set(gca,'XTick',0:tfinal/11:tfinal)
set(gca,'XTickLabel',xt)
grid on;
hold off
end


 
%  euler = {'Roll','Pitch','Yaw'};
% figure;
% for j = 1:3
% grid on;
% subplot(3,1,j)
% hold on
% plot(t,sun_true.Data(:,j),'k','Linewidth',1)
% plot(t,sun_meas.Data(:,j),'color',Purple,'Linewidth',1)
% plot(t,sun_est.Data(:,j),'color',Gold,'Linewidth',1)
% % legend(h,['q_',num2str(j),' error']);
% title([euler{j},' Time Evolution']) 
% ylabel([euler{j}, ' (deg)'])
%  xlabel('Time (min)')
%     xt = round([0:9.3*2:93.3],0);
%     xt(end) = 93.33;
% set(gca,'XTick',0:560*2:5600)
% set(gca,'XTickLabel',xt)
% grid on;
% hold off
% end
% 
% 


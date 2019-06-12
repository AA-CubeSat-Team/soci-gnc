% DESCRIPTION: This script tests the effect that a shifted epoch has on the
% suna and magnetic fields directly

% Author: Devan Tormey
% DATE: 6/7/2019

% 
% ~~~~~~~~~~~~~~~~~~~
% Gather Data
% ~~~~~~~~~~~~~~~~~~~

% 
t_0 = t0
shifted_epoch = t_0;
% 
timeshift = [0 60*10 60*20 60*30 60*40 60*50 60*60];
names = {'noShift','10min','20min','30min','40min','50min'};
for k = 1:6
    shifted_epoch = shifted_epoch + timeshift(k);
    sim('constant_rv_envTest.slx') 
    filename = names{k};
    save(filename)
    
end


%% 


% t0 = load('noShift.mat');
% t1 = load('10min.mat');
% t2 = load('20min.mat');
% t3 = load('30min.mat');
% t4 = load('40min.mat');
% t5 = load('50min.mat');
% t6 = load('60min.mat');

figure()
subplot(3,1,1)
hold all
title('b_x')
plot(t0.tout, t0.b_eci_unit.Data(:,1))
plot(t0.tout, t1.b_eci_unit.Data(:,1))
plot(t0.tout, t2.b_eci_unit.Data(:,1))
plot(t0.tout, t3.b_eci_unit.Data(:,1))
plot(t0.tout, t4.b_eci_unit.Data(:,1))
plot(t0.tout, t5.b_eci_unit.Data(:,1))
legend(names)
subplot(3,1,2)
title('b_y')
hold all
plot(t0.tout, t0.b_eci_unit.Data(:,2))
plot(t0.tout, t1.b_eci_unit.Data(:,2))
plot(t0.tout, t2.b_eci_unit.Data(:,2))
plot(t0.tout, t3.b_eci_unit.Data(:,2))
plot(t0.tout, t4.b_eci_unit.Data(:,2))
plot(t0.tout, t5.b_eci_unit.Data(:,2))
legend(names)
subplot(3,1,3)
hold all
title('b_y')
plot(t0.tout, t0.b_eci_unit.Data(:,3))
plot(t0.tout, t1.b_eci_unit.Data(:,3))
plot(t0.tout, t2.b_eci_unit.Data(:,3))
plot(t0.tout, t3.b_eci_unit.Data(:,3))
plot(t0.tout, t4.b_eci_unit.Data(:,3))
plot(t0.tout, t5.b_eci_unit.Data(:,3))
legend(names)

% plot(t0.tout, t6.b_eci_unit.Data(:,1))


figure()
subplot(3,1,1)
hold all
title('e_x')
plot(t0.tout, t0.sc2sun_eci_unit.Data(:,1))
plot(t0.tout, t1.sc2sun_eci_unit.Data(:,1))
plot(t0.tout, t2.sc2sun_eci_unit.Data(:,1))
plot(t0.tout, t3.sc2sun_eci_unit.Data(:,1))
plot(t0.tout, t4.sc2sun_eci_unit.Data(:,1))
plot(t0.tout, t5.sc2sun_eci_unit.Data(:,1))
legend(names)
subplot(3,1,2)
title('e_y')
hold all
plot(t0.tout, t0.sc2sun_eci_unit.Data(:,2))
plot(t0.tout, t1.sc2sun_eci_unit.Data(:,2))
plot(t0.tout, t2.sc2sun_eci_unit.Data(:,2))
plot(t0.tout, t3.sc2sun_eci_unit.Data(:,2))
plot(t0.tout, t4.sc2sun_eci_unit.Data(:,2))
plot(t0.tout, t5.sc2sun_eci_unit.Data(:,2))
legend(names)
subplot(3,1,3)
hold all
title('e_y')
plot(t0.tout, t0.sc2sun_eci_unit.Data(:,3))
plot(t0.tout, t1.sc2sun_eci_unit.Data(:,3))
plot(t0.tout, t2.sc2sun_eci_unit.Data(:,3))
plot(t0.tout, t3.sc2sun_eci_unit.Data(:,3))
plot(t0.tout, t4.sc2sun_eci_unit.Data(:,3))
plot(t0.tout, t5.sc2sun_eci_unit.Data(:,3))
legend(names)



%% 
figure
hold all
sgtitle('Error Quaterion')
% plot(t0.tout, t0.q_error.Data)
subplot(2,2,1)
plot(t1.tout, t1.q_error.Data)
title('10 Minutes')
subplot(2,2,2)
plot(t1.tout, t2.q_error.Data)
title('20 Minutes')
subplot(2,2,3)
plot(t1.tout, t3.q_error.Data)
title('30 Minutes')
subplot(2,2,4)
plot(t1.tout, t4.q_error.Data)
title('40 Minutes')
legend(names)







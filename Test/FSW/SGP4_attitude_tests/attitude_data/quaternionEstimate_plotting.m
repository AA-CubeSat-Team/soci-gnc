% DESCRIPTION: This script will run multiple trial of a full orbit sim
% to test how error in the initial time estimates effects our ability to
% detect the state.

% Author: Devan Tormey
% DATE: 6/6/2019

%% 
% ~~~~~~~~~~~~~~~~~~~
% Gather Data
% ~~~~~~~~~~~~~~~~~~~

shifted_epoch = t0;

timeshift = [0 60 60*60 60*60*24 60*60*24*7 60*60*24*30];
names = {'noShift','1min','1hour','1day','1week','1month'};
for k = 1:6
    shifted_epoch = shifted_epoch + timeshift(k);
    sim('Simplified_Sim.slx') 
    filename = names{k};
    save(filename)
    
end



%%
% ~~~~~~~~~~~~~~~~~~~~~~~~~
% Load Data From .mat Files
% ~~~~~~~~~~~~~~~~~~~~~~~~~

data.noShift = load('noShift.mat');
data.min = load('1min.mat');
data.hour = load('1hour.mat');
data.day = load('1day.mat');
data.week = load('1week.mat');
data.month = load('1month.mat');

names = {'0 Shift'; '1 Minute'; '1 Hour'; '1 Day'; '1 Week';'1 Moth'};

%% 
% ~~~~~~~~~~~~~~~~~~~~~~~~~
% Plot estimated Q
% ~~~~~~~~~~~~~~~~~~~~~~~~~
figure()
sgtitle('Quaternion Estimate')

subplot(2,3,1)
plot(data.noShift.tout,data.noShift.qHat_body.Data)
title('No Shift')
ylabel('Unit')
xlabel('Time [s]')

subplot(2,3,2)
plot(data.noShift.tout,data.min.qHat_body.Data)
title('1 Min')
ylabel('Unit')
xlabel('Time [s]')

subplot(2,3,3)
plot(data.noShift.tout,data.hour.qHat_body.Data)
title('1 Hour')
ylabel('Unit')
xlabel('Time [s]')

subplot(2,3,4)
plot(data.noShift.tout,data.day.qHat_body.Data)
title('1 Day')
ylabel('Unit')
xlabel('Time [s]')

subplot(2,3,5)
plot(data.noShift.tout,data.week.qHat_body.Data)
title('1 Week')
ylabel('Unit')
xlabel('Time [s]')

subplot(2,3,6)
plot(data.noShift.tout,data.month.qHat_body.Data)
title('1 Month')
ylabel('Unit')
xlabel('Time [s]')



%% 
% ~~~~~~~~~~~~~~~~~~~~~~~~~
% Plot estimate error
% ~~~~~~~~~~~~~~~~~~~~~~~~~
figure()
sgtitle('Error Quaternion')

subplot(2,3,1)
plot(data.noShift.tout,data.noShift.q_error.Data)
title('No Shift')
ylabel('Unit')
xlabel('Time [s]')

subplot(2,3,2)
plot(data.noShift.tout,data.min.q_error.Data)
title('1 Min')
ylabel('Unit')
xlabel('Time [s]')

subplot(2,3,3)
plot(data.noShift.tout,data.hour.q_error.Data)
title('1 Hour')
ylabel('Unit')
xlabel('Time [s]')

subplot(2,3,4)
plot(data.noShift.tout,data.day.q_error.Data)
title('1 Day')
ylabel('Unit')
xlabel('Time [s]')

subplot(2,3,5)
plot(data.noShift.tout,data.week.q_error.Data)
title('1 Week')
ylabel('Unit')
xlabel('Time [s]')

subplot(2,3,6)
plot(data.noShift.tout,data.month.q_error.Data)
title('1 Month')
ylabel('Unit')
xlabel('Time [s]')



%%
% ~~~~~~~~~~~~~~~~~~~~~~~~~
% Convert to euler angles
% ~~~~~~~~~~~~~~~~~~~~~~~~~

rad2deg = 57.295779513082320;
for k = 1:length(data.noShift.tout)
    temp = rad2deg*quat2eul(data.noShift.q_error.Data(k,:));
    data.noShift.eul(k,1) = temp(1);
    data.noShift.eul(k,2) = temp(2);
    data.noShift.eul(k,3) = temp(3);
    
    temp = norm(temp);
    data.noShift.eulnorm(k) = temp;
    
    temp = rad2deg*(quat2eul(data.min.q_error.Data(k,:)));
    data.min.eul(k,1) = temp(1);
    data.min.eul(k,2) = temp(2);
    data.min.eul(k,3) = temp(3);  
    
    temp = norm(temp);
    data.min.eulnorm(k) = temp;
    
    temp = rad2deg*(quat2eul(data.hour.q_error.Data(k,:)));
    data.hour.eul(k,1) = temp(1);
    data.hour.eul(k,2) = temp(2);
    data.hour.eul(k,3) = temp(3);  
    
    temp = norm(temp);
    data.hour.eulnorm(k) = temp;
    
    temp = rad2deg*(quat2eul(data.day.q_error.Data(k,:)));
    data.day.eul(k,1) = temp(1);
    data.day.eul(k,2) = temp(2);
    data.day.eul(k,3) = temp(3);
    
    temp = norm(temp);
    data.day.eulnorm(k) = temp;
    
    temp = rad2deg*(quat2eul(data.week.q_error.Data(k,:)));
    data.week.eul(k,1) = temp(1);
    data.week.eul(k,2) = temp(2);
    data.week.eul(k,3) = temp(3);
    
    temp = norm(temp);
    data.week.eulnorm(k) = temp;
    
    temp = rad2deg*(quat2eul(data.month.q_error.Data(k,:)));
    data.month.eul(k,1) = temp(1);
    data.month.eul(k,2) = temp(2);
    data.month.eul(k,3) = temp(3);
    
    temp = norm(temp);
    data.month.eulnorm(k) = temp;
end

%%
figure()
sgtitle('Error quat -> Euler Angle')
subplot(2,3,1)
plot(data.noShift.tout,data.noShift.eul)
title('No Shift')
ylabel('Degrees')
xlabel('Time [s]')

subplot(2,3,2)
plot(data.noShift.tout,data.min.eul)
title('1 Minute')
ylabel('Degrees')
xlabel('Time [s]')

subplot(2,3,3)
plot(data.noShift.tout,data.hour.eul)
title('1 Hour')
ylabel('Degrees')
xlabel('Time [s]')

subplot(2,3,4)
plot(data.noShift.tout,data.day.eul)
title('1 Day')
ylabel('Degrees')
xlabel('Time [s]')

subplot(2,3,5)
plot(data.noShift.tout,data.week.eul)
title('1 Week')
ylabel('Degrees')
xlabel('Time [s]')

subplot(2,3,6)
plot(data.noShift.tout,data.month.eul)
title('1 Month')
ylabel('Degrees')
xlabel('Time [s]')


figure()
sgtitle('Norm of Euler Angle Error')
subplot(2,3,1)
plot(data.noShift.tout,data.noShift.eulnorm)
title('No Shift')
ylabel('Degrees')
xlabel('Time [s]')

subplot(2,3,2)
plot(data.noShift.tout,data.min.eulnorm)
title('1 Minute')
ylabel('Degrees')
xlabel('Time [s]')

subplot(2,3,3)
plot(data.noShift.tout,data.hour.eulnorm)
title('1 Hour')
ylabel('Degrees')
xlabel('Time [s]')

subplot(2,3,4)
plot(data.noShift.tout,data.day.eulnorm)
title('1 Day')
ylabel('Degrees')
xlabel('Time [s]')

subplot(2,3,5)
plot(data.noShift.tout,data.week.eulnorm)
title('1 Week')
ylabel('Degrees')
xlabel('Time [s]')

subplot(2,3,6)
plot(data.noShift.tout,data.month.eulnorm)
title('1 Month')
ylabel('Degrees')
xlabel('Time [s]')






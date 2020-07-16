
t0 = simParams.time.epoch_utc_s;
GPS_time = [354557.74; 2070];
GPS_time(1) = GPS_time(1) + 18;

sim('time_versus_test.slx')

% for k = 1:length(tout)
%     devanSeconds(k)  = ymdhms_ut1_devan.Data(:,6,k);
%     taylorSeconds(k) = ymdhms_ut1_taylor.Data(:,6,k);
%     devanMinutes(k)  = ymdhms_ut1_devan.Data(:,5,k);
%     taylorminutes(k) = ymdhms_ut1_taylor.Data(:,5,k);
% end
devanSeconds = squeeze(ymdhms_ut1_devan.Data(:,6,:));
taylorSeconds = squeeze(ymdhms_ut1_taylor.Data(:,6,:));
devanMinutes = squeeze(ymdhms_ut1_devan.Data(:,5,:));
taylorMinutes = squeeze(ymdhms_ut1_taylor.Data(:,5,:));

figure();
subplot(2,1,1)
hold all
plot(tout,devanSeconds)
plot(tout,taylorSeconds)
legend('UT1 Seconds Devan','UT1 Seconds Taylor')
xlabel('Sim TimeStamp')
ylabel('Seconds')

subplot(2,1,2)
hold all
plot(tout,devanMinutes)
plot(tout,taylorMinutes)
legend('UT1 Minutes Devan','UT1 Minutes Taylor')
xlabel('Sim TimeStamp')
ylabel('Minutes')
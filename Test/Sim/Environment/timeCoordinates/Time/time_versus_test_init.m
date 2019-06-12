
t0 = simParams.time.epoch_utc_s;
GPS_time = [129600; 2034];
GPS_time(1) = GPS_time(1) + 18;

sim('time_test2.slx')

for k = 1:length(tout)
    devanSeconds(k) = ymdhms_ut1_devan.Data(:,6,k);
    taylorSeconds(k) = ymdhms_ut1_taylor.Data(:,6,k);
    devanMinutes(k) = ymdhms_ut1_devan.Data(:,5,k);
    taylorminutes(k) = ymdhms_ut1_taylor.Data(:,5,k);
end

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
plot(tout,taylorminutes)
legend('UT1 Minutes Devan','UT1 Minutes Taylor')
xlabel('Sim TimeStamp')
ylabel('Minutes')
ylim([0 5])



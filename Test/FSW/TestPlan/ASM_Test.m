function ASM_Test(testParams)

init_params; 

% READ THIS: Run Sim_init if you haven't already.

% Sim_init

% Sets the initial body rotation rate to two times the threshold for
% attitude stabilization mode. 
simParams.initialConditions.w_body_radps = 2*[1;1;1]*fswParams.mode_select.body_rate_threshold_max;

a = sim('Main_Sim', 'StartTime','0','StopTime','30');
gnc_mode = a.get('gnc_mode');
sc_body_rates_radps = a.get('sc_body_rates_radps');

figure(1)
subplot(2,1,1)
plot(gnc_mode.Time,gnc_mode.Data,'LineWidth',3')
title('SOC-I Attitude Stabilization Mode')
ylabel('GNC Mode')

subplot(2,1,2)
plot(sc_body_rates_radps.Time,sc_body_rates_radps.Data,'LineWidth',2')
xlabel('Time (s)')
ylabel('Body Rates (rad/s)')
legend('x','y','z')

if master_test ~= 1
    fileID = fopen('Test_Plan_Results','w');
end

fprintf(testParams.fileID,'ASM (Detumble) Test\n\n');

% The satellite has 30 seconds to detumble. There is no time requirements,
% but this should be easily met. 
dt = 30/simParams.sample_time_s;

w_final = sc_body_rates_radps.Data(dt,:);

w_mag_final = sqrt(w_final(1)^2 + w_final(2)^2 + w_final(3)^2);

fprintf(fileID,'After 30 seconds, does the satellite have a low rotation rate?\n');

if (w1(end)<=fswParams.mode_select.body_rate_threshold_max)
    
    fprintf(fileID,'Pass\n');
    formatSpec = 'The rotation rate after 30 seconds of detumbling is %1.4f rad/s\n\n';
    fprintf(fileID,formatSpec,w_mag_final)
    
else
    
    fprintf(fileID,'Fail\n');   
    formatSpec = 'The rotation rate after 30 seconds of detumbling is %1.4f rad/s\n\n';
    fprintf(fileID,formatSpec,w_mag_final)
    
end

timestep_left_ASM = find(gnc_mode.Data == 5 | gnc_mode.Data == 5 ,  1, 'first')

w_crit = sc_body_rates_radps.Data(timestep_left_ASM,:);

w_crit_mag = sqrt(w_crit(1)^2 + w_crit(2)^2 + w_crit(3)^2);

fprintf(fileID,'After the satellite switches out of detumble mode, does it actually have a low rotation rate?\n');

if (w_crit_mag <=fswParams.mode_select.body_rate_threshold_max)
    
    fprintf(fileID,'Pass\n');
    formatSpec = 'The rotation rate after the satellite switches out of detumble mode is %1.4f rad/s\n';
    fprintf(fileID,formatSpec,w_crit_mag)
    formatSpec = 'The new GNC mode is %1.1f \n\n';
    fprintf(fileID,formatSpec,gnc_mode.Data(timestep_left_ASM))
else
    
    

    fprintf(fileID,'Fail\n');
    formatSpec = 'The rotation rate after the satellite switches out of detumble mode is %1.4f rad/s\n';
    fprintf(fileID,formatSpec,w_crit_mag)
    formatSpec = 'The new GNC mode is %1.1f \n\n';
    fprintf(fileID,formatSpec,gnc_mode.Data(timestep_left_ASM))
    
end


if master_test ~= 1
    fclose(fileID);
end

end
    
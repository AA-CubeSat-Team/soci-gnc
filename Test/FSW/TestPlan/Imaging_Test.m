% Imaging Test

init_params; 

% READ THIS: Run Sim_init if you haven't already. For this test to work, 
% you must change the target lat, long, and alt to 60,120,0. This ensures 
% satellite flies over the ground target in a timely manner. You must also 
% enable imaging. 

% Sim_init

fprintf(fileID,'Imaging Test\n\n');

a = sim('Main_Sim', 'StartTime','0','StopTime','500');
gnc_mode = a.get('gnc_mode');
ace_err = a.get('ace_err');

figure(1)
subplot(2,1,1)
plot(gnc_mode.Time,gnc_mode.Data,'LineWidth',3')
title('SOC-I Imaging Mode')
ylabel('GNC Mode')

subplot(2,1,2)
plot(ace_err.Time,ace_err.Data,'LineWidth',2')
xlabel('Time (s)')
ylabel('Attitude Error (degrees)')

if master_test == 0
    fileID = fopen('Test_Plan_Results','w');
end

% The satellite has 30 seconds to orient its camera. There is no time requirements,
% but this should be easily met. 
dt = 30/simParams.sample_time_s;

timestep_into_imaging = find(gnc_mode.Data == 7,  1, 'first')

ace_imaging = ace_err.Data(timestep_into_imaging + dt)

if (ace_imaging<=1)
    
    fprintf(fileID,'Pass\n');
    formatSpec = 'The attitude control error after 30 seconds in imaging mode is %1.4f degrees\n\n';
    fprintf(fileID,formatSpec,ace_imaging)
    
else
    
    fprintf(fileID,'Fail\n');  
    formatSpec = 'The attitude control error after 30 seconds in imaging mode is %1.4f degrees\n\n';
    fprintf(fileID,formatSpec,ace_imaging)
    
end

if (master_test == 0)
    fclose(fileID);
end

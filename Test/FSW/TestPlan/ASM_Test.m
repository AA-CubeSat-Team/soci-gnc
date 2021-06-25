<<<<<<< HEAD
function asm_results = ASM_Test(testParams, fswParams)

%% Initialize the parameters
init_params; 
asm_results = struct;
rate_crit = nan;

%% Initializes boolean variables for pass/fail.
entered_asm_mode = true;
left_asm_mode = true;
correct_rate = true;
timely_detumble = true;
nomore_tumble = true; 
rate_crit = nan;
new_gnc = nan;

%% Modify parameters for this specific test
simParams.initialConditions.w_body_radps = 2*[1;1;1]*fswParams.mode_select.body_rate_threshold_max;

%% Start the simulation
data = sim('Main_Sim', 'StartTime','0','StopTime','60');

%% Get the relevant data from the simulation
gnc_mode = data.get('gnc_mode');
%sc_body_rates_radps = data.get('sc_body_rates_radps');
w_body_radps = data.get('w_body_radps');
rwa_cmd_rpm = data.get('rwa_cmd_rpm');

%% Checks that the data meets requirements

% Enters ASM mode?
for i = 1 : length(gnc_mode.Data)-1
    if (norm(w_body_radps.Data(i,:)) > fswParams.mode_select.body_rate_threshold_max && gnc_mode.Data(i+1) ~= 3) 
        entered_asm_mode = false;
        norm(w_body_radps.Data(i,:))
        gnc_mode.Data(i)
        break
    end  
end

% Leaves ASM mode when rates are below min threshold?
for i = 1 : length(gnc_mode.Data)-1
    if (norm(w_body_radps.Data(i,:)) < fswParams.mode_select.body_rate_threshold_min && gnc_mode.Data(i) == 3 && gnc_mode.Data(i+1) == 3) 
        left_asm_mode = false;
        break
    end  
end

% What is the rate when leaving ASM mode?
for i = 1 : length(gnc_mode.Data)-1
    if (gnc_mode.Data(i) == 3 && gnc_mode.Data(i+1) ~= 3) 
        rate_crit = norm(w_body_radps.Data(i+1,:));
        new_gnc = gnc_mode.Data(i+1);
        break
    end  
end

% Is the rate below min threshold after leaving ASM mode?
if (rate_crit > fswParams.mode_select.body_rate_threshold_min)
    correct_rate = false;
end

% Detumble in under 60 seconds?
if (norm(w_body_radps.Data(end,:)) > fswParams.mode_select.body_rate_threshold_max)
    timely_detumble = false;
end

% Does the spacecraft tumble again?
for i = 2 : length(gnc_mode.Data)-1
    if (norm(w_body_radps.Data(i,:)) < fswParams.mode_select.body_rate_threshold_max && norm(w_body_radps.Data(i+1,:)) > fswParams.mode_select.body_rate_threshold_max) 
        nomore_tumble = false;
        break
    end  
end

final_rate = norm(norm(w_body_radps.Data(end,:)));
        
%% Plots the data
figure(1)
subplot(3,1,1)
=======
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
>>>>>>> 96c8442 (Updates to Tests)
plot(gnc_mode.Time,gnc_mode.Data,'LineWidth',3')
title('SOC-I Attitude Stabilization Mode')
ylabel('GNC Mode')

<<<<<<< HEAD
subplot(3,1,2)
plot(w_body_radps.Time,w_body_radps.Data,'LineWidth',2')
=======
subplot(2,1,2)
plot(sc_body_rates_radps.Time,sc_body_rates_radps.Data,'LineWidth',2')
>>>>>>> 96c8442 (Updates to Tests)
xlabel('Time (s)')
ylabel('Body Rates (rad/s)')
legend('x','y','z')

<<<<<<< HEAD
subplot(3,1,3)
plot(rwa_cmd_rpm.Time,rwa_cmd_rpm.Data,'LineWidth',2')
xlabel('Time (s)')
ylabel('RPM')
legend('1','2','3','4')

if (testParams.save_figs)
    savefig('asmTest.fig')
end

%% Prints results to "Test_Plan_Results"
fprintf(testParams.fileID,'//////////ASM (Detumble) Test//////////\n\n');

fprintf(testParams.fileID,'Enters ASM mode when the rotation rate exceeds max threshold?\n');
if (entered_asm_mode == true)
    fprintf(testParams.fileID,'Pass\n');
    formatSpec = 'Initial rate: %1.4f rad/s\n\n';
    fprintf(testParams.fileID,formatSpec,norm(simParams.initialConditions.w_body_radps))
else 
    fprintf(testParams.fileID,'Fail\n\n'); 
end

fprintf(testParams.fileID,'Leaves ASM mode and enters some other nominal mode (5,6,7,8) after the rotation rate is below min threshold?\n');
if (left_asm_mode == true)
    fprintf(testParams.fileID,'Pass\n');
    formatSpec = 'Subsequent GNC Mode: %1.0f\n\n';
    fprintf(testParams.fileID,formatSpec,new_gnc)
else 
    fprintf(testParams.fileID,'Fail\n'); 
    formatSpec = 'Subsequent GNC Mode: %1.0f \n\n';
    fprintf(testParams.fileID,formatSpec,new_gnc)
end

fprintf(testParams.fileID,'Leaves ASM mode only after rate is below the min threshold?\n');
if (correct_rate == true)
    fprintf(testParams.fileID,'Pass\n');
    formatSpec = 'Rate: %1.4f rad/s\n\n';
    fprintf(testParams.fileID,formatSpec,rate_crit)
else 
    fprintf(testParams.fileID,'Fail\n'); 
    formatSpec = 'Rate: %1.4f rad/s\n\n';
    fprintf(testParams.fileID,formatSpec,rate_crit)
end

fprintf(testParams.fileID,'After 60 seconds, does the satellite have a low rotation rate?\n');
if (timely_detumble == true)
    fprintf(testParams.fileID,'Pass\n');
    formatSpec = 'Final rate: %1.4f rad/s\n\n';
    fprintf(testParams.fileID,formatSpec,final_rate)
else 
    fprintf(testParams.fileID,'Fail\n');
    formatSpec = 'Final rate: %1.4f rad/s\n\n';
    fprintf(testParams.fileID,formatSpec,final_rate) 
end

fprintf(testParams.fileID,'Does the satellite avoid tumbling again?\n');
if (nomore_tumble == true)
    fprintf(testParams.fileID,'Pass\n');
else 
    fprintf(testParams.fileID,'Fail\n'); 
end

%% Output relevant data
asm_results.entered_asm_mode = entered_asm_mode;
asm_results.left_asm_mode = left_asm_mode;
asm_results.correct_rate = correct_rate;
asm_results.timely_detumble = timely_detumble;
asm_results.nomore_tumble = nomore_tumble; 
asm_results.rate_crit = rate_crit;
%asm_results.new_gnc = new_gnc;
=======
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
>>>>>>> 96c8442 (Updates to Tests)

end
    
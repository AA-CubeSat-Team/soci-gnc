<<<<<<< HEAD
<<<<<<< HEAD
function asm_results = Imaging_Test(testParams, fswParams)

%% Initialize the parameters
init_params; 
imaging_results = struct;

%% Initializes boolean variables for pass/fail.
entered_img_mode = false;
camera_aligned = false;
sc_above_targ = false;
left_img_mode = false;
ake_acceptable = true;
ace_acceptable = true;
timely_sunseek = false;
new_gnc = nan;

%% Modify parameters for this specific test
% Imaging target set so that satellite will fly over target soon after
% sim start. Works for ourTLE.txt. 
cdh = Simulink.Mask.get('Main_Sim/CDH_command_lib');
target_lat_deg = cdh.Parameters(1);
target_lat_deg.set('Value','60.0');
target_lon_deg = cdh.Parameters(2);
target_lon_deg.set('Value','120.0');
target_alt_m = cdh.Parameters(3);
target_alt_m.set('Value','0.0');
enable_img = cdh.Parameters(8);
enable_img.set('Value','on');

lla = [0,51.7,0];
<<<<<<< HEAD
img_body = [0.0;0.0;-1.0];

% Temporary
fswParams.mode_select.body_rate_threshold_max = 0.262;
%% Start the simulation
data = sim('Main_Sim', 'StartTime','0','StopTime','1800');

%% Get the relevant data from the simulation
gnc_mode = data.get('gnc_mode');
rwa_cmd_rpm = data.get('rwa_cmd_rpm');
r_eci_km = data.get('r_eci_km');
MET_utc_s = data.get('MET_utc_s');
ake_deg = data.get('ake_deg');
ace_deg = data.get('ace_deg');
sc_quat = data.get('sc_quat');
w_body_radps = data.get('w_body_radps');
ss_valid = data.get('ss_valid');

%% Checks that the data meets requirements


% Calculates position of ground target in ECEF coordinates:
targ_ecef = 0.001*lla2ecef(lla).';

% Enters img mode for atleast 45 seconds? What time?
for i = 1 : length(gnc_mode.Data) - testParams.maneuver_time/fswParams.sample_time_s
    if (gnc_mode.Data(i) == 7 && gnc_mode.Data(i + testParams.maneuver_time/fswParams.sample_time_s) == 7) 
        entered_img_mode = true;
        time_entered_img = gnc_mode.time(i);
        break
    end  
end 

% Checks that the camera is aligned (within 7 degrees)
for i = testParams.maneuver_time/fswParams.sample_time_s + 1 : length(gnc_mode.Data)
    if (gnc_mode.Data(i - testParams.maneuver_time/fswParams.sample_time_s) == 7 && gnc_mode.Data(i) == 7)
        deg = (360.9856123035484 * (MET_utc_s.data(i)/86400) + 280.46)*pi/180;
        dcm_ecef = [cos(deg),-sin(deg),0;sin(deg),cos(deg),0;0,0,1];
        sat_ecef = dcm_ecef * r_eci_km.data(i,:).';
        sc2targ = targ_ecef - sat_ecef;
        dcm_attitude = quat2dcm(sc_quat.data(i,:));
        img_vec =  dcm_ecef * dcm_attitude.' * img_body;
        deg_err = (180/pi) * acos(dot(sc2targ,img_vec)/(norm(sc2targ)*norm(img_vec)));
      
        if (deg_err < 7)
            camera_aligned = true;
        end
        % Checks that the satellite is actually above the target:
        if (dot(sc2targ, targ_ecef) < 0)
            sc_above_targ = true;
            img_elevation = (pi/2 - acos(dot(-sc2targ, targ_ecef)/(norm(sc2targ)*norm(targ_ecef)))) * 180/pi;
        end
        break
    end   
end

deg_err
ace_deg.data(i)

% Checks AKE
for i = testParams.attitude_acq_time/fswParams.sample_time_s + 1 : length(gnc_mode.Data)
    if (ss_valid.data(i) && ss_valid.data(i - testParams.attitude_acq_time/fswParams.sample_time_s) && ake_deg.data(i) > 3.5 && ss_valid.data(i)) 
      ake_acceptable = false;
      ake_fault = ake_deg.data(i);
      ake_fault_time = gnc_mode.time(i);
      ake_fault_mode = gnc_mode.data(i);
      break
    end 
end



% Checks ACE
for i = testParams.maneuver_time/fswParams.sample_time_s + 1 : length(gnc_mode.Data)
    if (gnc_mode.Data(i) == 5 && gnc_mode.Data(i - testParams.maneuver_time/fswParams.sample_time_s) == 5) 
        if (ace_deg.data(i) > 3.5)
        ace_acceptable = false;
        ace_fault = ace_deg.data(i);
        ace_fault_time = gnc_mode.time(i);
        ace_fault_mode = gnc_mode.data(i);
        break
        end 
    end
    if (gnc_mode.Data(i) == 6 && gnc_mode.Data(i - testParams.maneuver_time/fswParams.sample_time_s) == 6) 
        if (ace_deg.data(i) > 3.5)
        ace_acceptable = false;
        ace_fault = ace_deg.data(i);
        ace_fault_time = gnc_mode.time(i);
        ace_fault_mode = gnc_mode.data(i);
        break
        end 
    end 
    if (gnc_mode.Data(i) == 7 && gnc_mode.Data(i - testParams.maneuver_time/fswParams.sample_time_s) == 7) 
        if (ace_deg.data(i) > 3.5)
        ace_acceptable = false;
        ace_fault = ace_deg.data(i);
        ace_fault_time = gnc_mode.time(i);
        ace_fault_mode = gnc_mode.data(i);
        break
        end 
    end 
    if (gnc_mode.Data(i) == 8 && gnc_mode.Data(i - testParams.maneuver_time/fswParams.sample_time_s) == 8) 
        if (ace_deg.data(i) > 3.5)
        ace_acceptable = false;
        ace_fault = ace_deg.data(i);
        ace_fault_time = gnc_mode.time(i);
        ace_fault_mode = gnc_mode.data(i);
        break
        end 
    end 
end

% Checks that the satellite leaves imaging mode and goes into nominal mode
% when it is no longer over the target: 
for i = 2 : length(gnc_mode.Data)
    if (gnc_mode.Data(i-1) == 7 && (gnc_mode.Data(i) == 6 || gnc_mode.Data(i) == 5))
        deg = ((1/86400) * 360.9856123035484 * MET_utc_s.data(i) + 280.46)*pi/180;
        deg = deg + 0*pi/180;
        dcm_ecef = [cos(deg),sin(deg),0;-sin(deg),cos(deg),0;0,0,1];
        sat_ecef = dcm_ecef * r_eci_km.data(i,:).';
        sc2targ = targ_ecef - sat_ecef;
        elevation = pi/2 - acos(dot(-sc2targ, targ_ecef)/(norm(sc2targ)*norm(targ_ecef)));
        if (elevation < 1.5*fswParams.ground_targs(2).min_elev_rad)
            left_img_mode = true;
            left_img_elevation = elevation * 180/pi;
        end
        break
    end
end

        
%% Plots the data
figure(1)
subplot(3,2,1)
plot(gnc_mode.Time,gnc_mode.Data,'LineWidth',3')
title('SOC-I Attitude Stabilization Mode')
ylabel('GNC Mode')

subplot(3,2,2)
plot(w_body_radps.Time,w_body_radps.Data,'LineWidth',2')
xlabel('Time (s)')
ylabel('Body Rates (rad/s)')
legend('x','y','z')

subplot(3,2,3)
plot(ake_deg.Time,ake_deg.Data,'LineWidth',2')
ylabel('Attitude Knowledge Error (deg)')

subplot(3,2,4)
plot(rwa_cmd_rpm.Time,rwa_cmd_rpm.Data,'LineWidth',2')
xlabel('Time (s)')
ylabel('RPM')
legend('1','2','3','4')

subplot(3,2,5)
plot(ace_deg.Time,ace_deg.Data,'LineWidth',2')
ylabel('Attitude Control Error (deg)')

subplot(3,2,6)
plot(ss_valid.Time,ss_valid.Data,'LineWidth',2')
xlabel('Time (s)')
ylabel('SS Valid')


if (testParams.save_figs)
    savefig('asmTest.fig')
end

%% Prints results to "Test_Plan_Results"
fprintf(testParams.fileID,'//////////Imaging Test//////////\n\n');

fprintf(testParams.fileID,'Enters IMG mode?\n');
if (entered_img_mode == true)
    fprintf(testParams.fileID,'Pass\n');
    formatSpec = 'Time entered IMG mode: %1.4f seconds\n\n';
    fprintf(testParams.fileID,formatSpec,time_entered_img);
else 
    fprintf(testParams.fileID,'Fail\n\n'); 
end

fprintf(testParams.fileID,'Is the camera aligned with the target 45 seconds into img mode?\n');
if (camera_aligned == true)
    fprintf(testParams.fileID,'Pass\n');
    formatSpec = 'Degree error: %1.4f\n\n';
    fprintf(testParams.fileID,formatSpec,deg_err);
else 
    fprintf(testParams.fileID,'Fail\n'); 
    formatSpec = 'Error: %1.4f deg\n\n';
    fprintf(testParams.fileID,formatSpec,deg_err);
end

fprintf(testParams.fileID,'Is the satellite actually above the ground target?\n');
if (sc_above_targ == true)
    fprintf(testParams.fileID,'Pass\n');
    formatSpec = 'Elevation: %1.4f deg\n\n';
    fprintf(testParams.fileID,formatSpec,img_elevation);
else 
    fprintf(testParams.fileID,'Fail\n'); 
    formatSpec = 'Rate: %1.4f deg\n\n';
    fprintf(testParams.fileID,formatSpec,img_elevation);
end

fprintf(testParams.fileID,'Does the AKE meet requirements?\n');
if (ake_acceptable == true)
    fprintf(testParams.fileID,'Pass\n\n');
else 
    fprintf(testParams.fileID,'Fail\n');
    formatSpec = 'AKE Fault Degrees: %1.4f deg\n\n';
    fprintf(testParams.fileID,formatSpec,ake_deg);
    formatSpec = 'AKE Fault GNC Mode: %1.0f\n\n';
    fprintf(testParams.fileID,formatSpec,ake_fault_mode);
    formatSpec = 'AKE Fault Time: %1.0f\n\n';
    fprintf(testParams.fileID,formatSpec,ake_fault_time);
end

fprintf(testParams.fileID,'Does the ACE meet requirements?\n');
if (ace_acceptable == true)
    fprintf(testParams.fileID,'Pass\n\n');
else 
    fprintf(testParams.fileID,'Fail\n');
    formatSpec = 'ACE Fault Degrees: %1.4f deg\n\n';
    fprintf(testParams.fileID,formatSpec,ace_deg);
    formatSpec = 'ACE Fault GNC Mode: %1.0f\n\n';
    fprintf(testParams.fileID,formatSpec,ace_fault_mode);
    formatSpec = 'ACE Fault Time: %1.0f\n\n';
    fprintf(testParams.fileID,formatSpec,ace_fault_time);
end

fprintf(testParams.fileID,'Does the satellite leave img mode?\n');
if (left_img_mode == true)
    fprintf(testParams.fileID,'Pass\n');
    formatSpec = 'Elevation: %1.4f deg\n\n';
    fprintf(testParams.fileID,formatSpec,left_img_elevation);
else 
    fprintf(testParams.fileID,'Fail\n\n'); 
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
% Imaging Test
=======
function asm_results = Imaging_Test(testParams, fswParams)
>>>>>>> 99f7254 (From bottom to top: Added a bunch of code to ASM_Test, Imaging_Test, and Master_Test as part of implementing the fsw test plan. Deleted some extraneous files. Fixed an obvious mistake in target_gen_lib that caused the camera to be the secondary pointing objective, and to point nadir during img mode. Changed the detumble mode select to be triggered by the 2-norm rather than the inf-norm of the rotation rate. I think this makes more sense. Fixed a couple sign errors in the groundpass_predict library which caused the camera to point 180 degrees from the target. Added a testParams_init file.)

%% Initialize the parameters
init_params; 
imaging_results = struct;

%% Initializes boolean variables for pass/fail.
entered_img_mode = false;
camera_aligned = false;
sc_above_targ = false;
left_img_mode = false;
ake_acceptable = true;
ace_acceptable = true;
timely_sunseek = false;
new_gnc = nan;

%% Modify parameters for this specific test
% Imaging target set so that satellite will fly over target soon after
% sim start. Works for ourTLE.txt. 
cdh = Simulink.Mask.get('Main_Sim/CDH_command_lib');
target_lat_deg = cdh.Parameters(1);
target_lat_deg.set('Value','60.0');
target_lon_deg = cdh.Parameters(2);
target_lon_deg.set('Value','120.0');
target_alt_m = cdh.Parameters(3);
target_alt_m.set('Value','0.0');
enable_img = cdh.Parameters(8);
enable_img.set('Value','on');

lla = [60,120,0];
=======
>>>>>>> 94a60c7 (Added gs_above_targ to the fsw_telemetry bus so that I can use it for testing. Put default_config back in the right place. Added another output to FSW_Lib so that I can use it as part of testing. Fixed an error in the eci to ecef conversion which was causing the Earth to rotate in the wrong direction. Fixed a sign error in groundpass_predict_lib. Fixed an obvious bug in mode_select_lib which made img mode have the wrong attitude targets. Added a bunch of new code to Imaging_Test and Master_Test and testParams_init.)
img_body = [0.0;0.0;-1.0];

% Temporary
fswParams.mode_select.body_rate_threshold_max = 0.262;
%% Start the simulation
data = sim('Main_Sim', 'StartTime','0','StopTime','1800');

%% Get the relevant data from the simulation
gnc_mode = data.get('gnc_mode');
rwa_cmd_rpm = data.get('rwa_cmd_rpm');
r_eci_km = data.get('r_eci_km');
MET_utc_s = data.get('MET_utc_s');
ake_deg = data.get('ake_deg');
ace_deg = data.get('ace_deg');
sc_quat = data.get('sc_quat');
w_body_radps = data.get('w_body_radps');
ss_valid = data.get('ss_valid');

%% Checks that the data meets requirements


% Calculates position of ground target in ECEF coordinates:
targ_ecef = 0.001*lla2ecef(lla).';

% Enters img mode for atleast 45 seconds? What time?
for i = 1 : length(gnc_mode.Data) - testParams.maneuver_time/fswParams.sample_time_s
    if (gnc_mode.Data(i) == 7 && gnc_mode.Data(i + testParams.maneuver_time/fswParams.sample_time_s) == 7) 
        entered_img_mode = true;
        time_entered_img = gnc_mode.time(i);
        break
    end  
end 

% Checks that the camera is aligned (within 7 degrees)
for i = testParams.maneuver_time/fswParams.sample_time_s + 1 : length(gnc_mode.Data)
    if (gnc_mode.Data(i - testParams.maneuver_time/fswParams.sample_time_s) == 7 && gnc_mode.Data(i) == 7)
        deg = (360.9856123035484 * (MET_utc_s.data(i)/86400) + 280.46)*pi/180;
        dcm_ecef = [cos(deg),-sin(deg),0;sin(deg),cos(deg),0;0,0,1];
        sat_ecef = dcm_ecef * r_eci_km.data(i,:).';
        sc2targ = targ_ecef - sat_ecef;
        dcm_attitude = quat2dcm(sc_quat.data(i,:));
        img_vec =  dcm_ecef * dcm_attitude.' * img_body;
        deg_err = (180/pi) * acos(dot(sc2targ,img_vec)/(norm(sc2targ)*norm(img_vec)));
      
        if (deg_err < 7)
            camera_aligned = true;
        end
        % Checks that the satellite is actually above the target:
        if (dot(sc2targ, targ_ecef) < 0)
            sc_above_targ = true;
            img_elevation = (pi/2 - acos(dot(-sc2targ, targ_ecef)/(norm(sc2targ)*norm(targ_ecef)))) * 180/pi;
        end
        break
    end   
end

deg_err
ace_deg.data(i)

% Checks AKE
for i = testParams.attitude_acq_time/fswParams.sample_time_s + 1 : length(gnc_mode.Data)
    if (ss_valid.data(i) && ss_valid.data(i - testParams.attitude_acq_time/fswParams.sample_time_s) && ake_deg.data(i) > 3.5 && ss_valid.data(i)) 
      ake_acceptable = false;
      ake_fault = ake_deg.data(i);
      ake_fault_time = gnc_mode.time(i);
      ake_fault_mode = gnc_mode.data(i);
      break
    end 
end



% Checks ACE
for i = testParams.maneuver_time/fswParams.sample_time_s + 1 : length(gnc_mode.Data)
    if (gnc_mode.Data(i) == 5 && gnc_mode.Data(i - testParams.maneuver_time/fswParams.sample_time_s) == 5) 
        if (ace_deg.data(i) > 3.5)
        ace_acceptable = false;
        ace_fault = ace_deg.data(i);
        ace_fault_time = gnc_mode.time(i);
        ace_fault_mode = gnc_mode.data(i);
        break
        end 
    end
    if (gnc_mode.Data(i) == 6 && gnc_mode.Data(i - testParams.maneuver_time/fswParams.sample_time_s) == 6) 
        if (ace_deg.data(i) > 3.5)
        ace_acceptable = false;
        ace_fault = ace_deg.data(i);
        ace_fault_time = gnc_mode.time(i);
        ace_fault_mode = gnc_mode.data(i);
        break
        end 
    end 
    if (gnc_mode.Data(i) == 7 && gnc_mode.Data(i - testParams.maneuver_time/fswParams.sample_time_s) == 7) 
        if (ace_deg.data(i) > 3.5)
        ace_acceptable = false;
        ace_fault = ace_deg.data(i);
        ace_fault_time = gnc_mode.time(i);
        ace_fault_mode = gnc_mode.data(i);
        break
        end 
    end 
    if (gnc_mode.Data(i) == 8 && gnc_mode.Data(i - testParams.maneuver_time/fswParams.sample_time_s) == 8) 
        if (ace_deg.data(i) > 3.5)
        ace_acceptable = false;
        ace_fault = ace_deg.data(i);
        ace_fault_time = gnc_mode.time(i);
        ace_fault_mode = gnc_mode.data(i);
        break
        end 
    end 
end

% Checks that the satellite leaves imaging mode and goes into nominal mode
% when it is no longer over the target: 
for i = 2 : length(gnc_mode.Data)
    if (gnc_mode.Data(i-1) == 7 && (gnc_mode.Data(i) == 6 || gnc_mode.Data(i) == 5))
        deg = ((1/86400) * 360.9856123035484 * MET_utc_s.data(i) + 280.46)*pi/180;
        deg = deg + 0*pi/180;
        dcm_ecef = [cos(deg),sin(deg),0;-sin(deg),cos(deg),0;0,0,1];
        sat_ecef = dcm_ecef * r_eci_km.data(i,:).';
        sc2targ = targ_ecef - sat_ecef;
        elevation = pi/2 - acos(dot(-sc2targ, targ_ecef)/(norm(sc2targ)*norm(targ_ecef)));
        if (elevation < 1.5*fswParams.ground_targs(2).min_elev_rad)
            left_img_mode = true;
            left_img_elevation = elevation * 180/pi;
        end
        break
    end
end

        
%% Plots the data
figure(1)
subplot(3,2,1)
plot(gnc_mode.Time,gnc_mode.Data,'LineWidth',3')
title('SOC-I Attitude Stabilization Mode')
ylabel('GNC Mode')

subplot(3,2,2)
plot(w_body_radps.Time,w_body_radps.Data,'LineWidth',2')
xlabel('Time (s)')
ylabel('Body Rates (rad/s)')
legend('x','y','z')

subplot(3,2,3)
plot(ake_deg.Time,ake_deg.Data,'LineWidth',2')
ylabel('Attitude Knowledge Error (deg)')

subplot(3,2,4)
plot(rwa_cmd_rpm.Time,rwa_cmd_rpm.Data,'LineWidth',2')
xlabel('Time (s)')
ylabel('RPM')
legend('1','2','3','4')

subplot(3,2,5)
plot(ace_deg.Time,ace_deg.Data,'LineWidth',2')
ylabel('Attitude Control Error (deg)')

subplot(3,2,6)
plot(ss_valid.Time,ss_valid.Data,'LineWidth',2')
xlabel('Time (s)')
ylabel('SS Valid')


if (testParams.save_figs)
    savefig('asmTest.fig')
end

%% Prints results to "Test_Plan_Results"
fprintf(testParams.fileID,'//////////Imaging Test//////////\n\n');

fprintf(testParams.fileID,'Enters IMG mode?\n');
if (entered_img_mode == true)
    fprintf(testParams.fileID,'Pass\n');
    formatSpec = 'Time entered IMG mode: %1.4f seconds\n\n';
    fprintf(testParams.fileID,formatSpec,time_entered_img);
else 
    fprintf(testParams.fileID,'Fail\n\n'); 
end

fprintf(testParams.fileID,'Is the camera aligned with the target 45 seconds into img mode?\n');
if (camera_aligned == true)
    fprintf(testParams.fileID,'Pass\n');
    formatSpec = 'Degree error: %1.4f\n\n';
    fprintf(testParams.fileID,formatSpec,deg_err);
else 
    fprintf(testParams.fileID,'Fail\n'); 
    formatSpec = 'Error: %1.4f deg\n\n';
    fprintf(testParams.fileID,formatSpec,deg_err);
end

fprintf(testParams.fileID,'Is the satellite actually above the ground target?\n');
if (sc_above_targ == true)
    fprintf(testParams.fileID,'Pass\n');
    formatSpec = 'Elevation: %1.4f deg\n\n';
    fprintf(testParams.fileID,formatSpec,img_elevation);
else 
    fprintf(testParams.fileID,'Fail\n'); 
    formatSpec = 'Rate: %1.4f deg\n\n';
    fprintf(testParams.fileID,formatSpec,img_elevation);
end

<<<<<<< HEAD
<<<<<<< HEAD
if (master_test == 0)
    fclose(fileID);
>>>>>>> 96c8442 (Updates to Tests)
=======
fprintf(testParams.fileID,'After 30 seconds, does the satellite have a low rotation rate?\n');
if (timely_detumble == true)
    fprintf(testParams.fileID,'Pass\n');
    formatSpec = 'Final rate: %1.4f rad/s\n\n';
    fprintf(testParams.fileID,formatSpec,final_rate)
=======
fprintf(testParams.fileID,'Does the AKE meet requirements?\n');
if (ake_acceptable == true)
    fprintf(testParams.fileID,'Pass\n\n');
>>>>>>> 94a60c7 (Added gs_above_targ to the fsw_telemetry bus so that I can use it for testing. Put default_config back in the right place. Added another output to FSW_Lib so that I can use it as part of testing. Fixed an error in the eci to ecef conversion which was causing the Earth to rotate in the wrong direction. Fixed a sign error in groundpass_predict_lib. Fixed an obvious bug in mode_select_lib which made img mode have the wrong attitude targets. Added a bunch of new code to Imaging_Test and Master_Test and testParams_init.)
else 
    fprintf(testParams.fileID,'Fail\n');
    formatSpec = 'AKE Fault Degrees: %1.4f deg\n\n';
    fprintf(testParams.fileID,formatSpec,ake_deg);
    formatSpec = 'AKE Fault GNC Mode: %1.0f\n\n';
    fprintf(testParams.fileID,formatSpec,ake_fault_mode);
    formatSpec = 'AKE Fault Time: %1.0f\n\n';
    fprintf(testParams.fileID,formatSpec,ake_fault_time);
end

fprintf(testParams.fileID,'Does the ACE meet requirements?\n');
if (ace_acceptable == true)
    fprintf(testParams.fileID,'Pass\n\n');
else 
    fprintf(testParams.fileID,'Fail\n');
    formatSpec = 'ACE Fault Degrees: %1.4f deg\n\n';
    fprintf(testParams.fileID,formatSpec,ace_deg);
    formatSpec = 'ACE Fault GNC Mode: %1.0f\n\n';
    fprintf(testParams.fileID,formatSpec,ace_fault_mode);
    formatSpec = 'ACE Fault Time: %1.0f\n\n';
    fprintf(testParams.fileID,formatSpec,ace_fault_time);
end

fprintf(testParams.fileID,'Does the satellite leave img mode?\n');
if (left_img_mode == true)
    fprintf(testParams.fileID,'Pass\n');
    formatSpec = 'Elevation: %1.4f deg\n\n';
    fprintf(testParams.fileID,formatSpec,left_img_elevation);
else 
    fprintf(testParams.fileID,'Fail\n\n'); 
end

%% Output relevant data
asm_results.entered_asm_mode = entered_asm_mode;
asm_results.left_asm_mode = left_asm_mode;
asm_results.correct_rate = correct_rate;
asm_results.timely_detumble = timely_detumble;
asm_results.nomore_tumble = nomore_tumble; 
asm_results.rate_crit = rate_crit;
%asm_results.new_gnc = new_gnc;

>>>>>>> 99f7254 (From bottom to top: Added a bunch of code to ASM_Test, Imaging_Test, and Master_Test as part of implementing the fsw test plan. Deleted some extraneous files. Fixed an obvious mistake in target_gen_lib that caused the camera to be the secondary pointing objective, and to point nadir during img mode. Changed the detumble mode select to be triggered by the 2-norm rather than the inf-norm of the rotation rate. I think this makes more sense. Fixed a couple sign errors in the groundpass_predict library which caused the camera to point 180 degrees from the target. Added a testParams_init file.)
end

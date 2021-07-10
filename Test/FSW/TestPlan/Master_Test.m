%% SOC-I Flight Software Master Test
% This script runs the following tests using the Main_Sim:
% - Detumble Test - Checks that the satellite automatically detumbles when
%   the rotation rate exceeds the detumble threshold.  
% - Imaging Test - Checks that the satellite goes into imaging mode when it
%   is over the imaging target, and that the camera is pointed at the
%   target. 
% - Ground Station Test - Checks that the satellite points the antenna
%   towards the ground station when it is over the ground station.
% - SOAR Test - Checks that during a SOAR maneuver, the ACE meets
%   requirements, the sun remains in view, the camera vector does not line 
%   up with the sun vector, commanded torque is not exceeded, angular
%   velocity limits are not exceeded, maneuver is finished in predetermined
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
%   amount of time. (SOCI-SYS-002 4.9)
=======
%   amount of time. 
>>>>>>> f035040 (Added null_vec to the RWA bus, which is needed for the rwa null allocator to work. Added some test plan tests, which are still in progress. Added a max rate test and a allocator simulator, which are still in progress.)
=======
%   amount of time. (SOCI-SYS-002 4.9)
>>>>>>> 96c8442 (Updates to Tests)
=======
%   amount of time. 
>>>>>>> f035040 (Added null_vec to the RWA bus, which is needed for the rwa null allocator to work. Added some test plan tests, which are still in progress. Added a max rate test and a allocator simulator, which are still in progress.)
=======
%   amount of time. (SOCI-SYS-002 4.9)
>>>>>>> 96c8442 (Updates to Tests)
% - Actuator Failure Test - Checks that if a reaction wheel fails, the
%   satellite only allocates rpm's to the working reaction wheels, and the
%   ACE is still within requirements. 
% - Sun Sensor Failure Test - Checks that the AKE meets requirements if the
%   sun sensor fails. 
% - Long Term Test - (This one takes a while, you might want to skip it)
%   Checks that the ACE and AKE requirements are met, that the satellite
%   switches GNC modes when it should, that the satellite handles
%   disturbances, maintains desired RWA momentum, and that the solar panel 
%   effective area is maximized.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 96c8442 (Updates to Tests)
=======
>>>>>>> 96c8442 (Updates to Tests)
% - Desaturation Test - Checks that the reaction wheel rotation rates stay
%   near the commanded rotation rates after the satellite is subjected to a
%   disturbance torque. 
%   Solar Test - Checks that solar panel effective area is maximized
%   and that the sun sensor points at the sun over different GNC mode. 

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
testParams_init

fprintf(testParams.fileID,'SOC-I Flight Software Master Test Results\n\n');

%asm_results = ASM_Test(testParams, fswParams)

imaging_results = Imaging_Test(testParams, fswParams)


fclose(testParams.fileID);



=======
=======
fileID = fopen('Test_Plan_Results','w');
fprintf(fileID,'SOC-I Flight Software Master Test Results\n\n');
=======
testParams_init
>>>>>>> 99f7254 (From bottom to top: Added a bunch of code to ASM_Test, Imaging_Test, and Master_Test as part of implementing the fsw test plan. Deleted some extraneous files. Fixed an obvious mistake in target_gen_lib that caused the camera to be the secondary pointing objective, and to point nadir during img mode. Changed the detumble mode select to be triggered by the 2-norm rather than the inf-norm of the rotation rate. I think this makes more sense. Fixed a couple sign errors in the groundpass_predict library which caused the camera to point 180 degrees from the target. Added a testParams_init file.)

fprintf(testParams.fileID,'SOC-I Flight Software Master Test Results\n\n');

<<<<<<< HEAD
<<<<<<< HEAD
master_test = 1;
>>>>>>> 96c8442 (Updates to Tests)
=======
asm_results = ASM_Test(testParams, fswParams)
>>>>>>> 99f7254 (From bottom to top: Added a bunch of code to ASM_Test, Imaging_Test, and Master_Test as part of implementing the fsw test plan. Deleted some extraneous files. Fixed an obvious mistake in target_gen_lib that caused the camera to be the secondary pointing objective, and to point nadir during img mode. Changed the detumble mode select to be triggered by the 2-norm rather than the inf-norm of the rotation rate. I think this makes more sense. Fixed a couple sign errors in the groundpass_predict library which caused the camera to point 180 degrees from the target. Added a testParams_init file.)
=======
%asm_results = ASM_Test(testParams, fswParams)
>>>>>>> 94a60c7 (Added gs_above_targ to the fsw_telemetry bus so that I can use it for testing. Put default_config back in the right place. Added another output to FSW_Lib so that I can use it as part of testing. Fixed an error in the eci to ecef conversion which was causing the Earth to rotate in the wrong direction. Fixed a sign error in groundpass_predict_lib. Fixed an obvious bug in mode_select_lib which made img mode have the wrong attitude targets. Added a bunch of new code to Imaging_Test and Master_Test and testParams_init.)

imaging_results = Imaging_Test(testParams, fswParams)


fclose(testParams.fileID);



<<<<<<< HEAD
fprintf(fileID,'%6s %12s\n','x','exp(x)');
fprintf(fileID,'%6.2f %12.8f\n',A);
fclose(fileID);
>>>>>>> f035040 (Added null_vec to the RWA bus, which is needed for the rwa null allocator to work. Added some test plan tests, which are still in progress. Added a max rate test and a allocator simulator, which are still in progress.)
=======
>>>>>>> 96c8442 (Updates to Tests)
=======
=======
fileID = fopen('Test_Plan_Results','w');
fprintf(fileID,'SOC-I Flight Software Master Test Results\n\n');
=======
testParams_init
>>>>>>> 99f7254 (From bottom to top: Added a bunch of code to ASM_Test, Imaging_Test, and Master_Test as part of implementing the fsw test plan. Deleted some extraneous files. Fixed an obvious mistake in target_gen_lib that caused the camera to be the secondary pointing objective, and to point nadir during img mode. Changed the detumble mode select to be triggered by the 2-norm rather than the inf-norm of the rotation rate. I think this makes more sense. Fixed a couple sign errors in the groundpass_predict library which caused the camera to point 180 degrees from the target. Added a testParams_init file.)

fprintf(testParams.fileID,'SOC-I Flight Software Master Test Results\n\n');

<<<<<<< HEAD
master_test = 1;
>>>>>>> 96c8442 (Updates to Tests)
=======
asm_results = ASM_Test(testParams, fswParams)
>>>>>>> 99f7254 (From bottom to top: Added a bunch of code to ASM_Test, Imaging_Test, and Master_Test as part of implementing the fsw test plan. Deleted some extraneous files. Fixed an obvious mistake in target_gen_lib that caused the camera to be the secondary pointing objective, and to point nadir during img mode. Changed the detumble mode select to be triggered by the 2-norm rather than the inf-norm of the rotation rate. I think this makes more sense. Fixed a couple sign errors in the groundpass_predict library which caused the camera to point 180 degrees from the target. Added a testParams_init file.)

%imaging_results = Imaging_Test(testParams, fswParams)


fclose(testParams.fileID);



<<<<<<< HEAD
fprintf(fileID,'%6s %12s\n','x','exp(x)');
fprintf(fileID,'%6.2f %12.8f\n',A);
fclose(fileID);
>>>>>>> f035040 (Added null_vec to the RWA bus, which is needed for the rwa null allocator to work. Added some test plan tests, which are still in progress. Added a max rate test and a allocator simulator, which are still in progress.)
=======
>>>>>>> 96c8442 (Updates to Tests)

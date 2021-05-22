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
%   amount of time. 
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

ASM_Test

x = 0:.1:1;
A = [x; exp(x)];

fileID = fopen('Test_Plan_Results','w');
fprintf(fileID,'SOC-I Flight Software Master Test Results\n\n');

fprintf(fileID,'%6s %12s\n','x','exp(x)');
fprintf(fileID,'%6.2f %12.8f\n',A);
fclose(fileID);
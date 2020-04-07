% Initialization of the Slew rate and Control constrained controller unit
% test. Follows the design and methodology in "Feedback control logic for eigenaxis
% rotations under slew rate and control constraints"
%
%
% Author: Cole Morgan


simParams.actuators.rwa.ic.rpm = [4600; -3400; 1900; -2000]; 
% chosen "randomly" with at least 1 above the saturation limit of 4500rpm 

fswParams.
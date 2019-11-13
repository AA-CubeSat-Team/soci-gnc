% Initialization of the Allocator.
% Stores various methods for distributing the total body-axis 
% control command to the available actuators.
%
%
% Author: Cole Morgan


allocator = struct;

alpha = 23; % angle of the reaction wheels

A = [cosd(alpha) 0 -cosd(alpha) 0;
    0 cosd(alpha) 0 -cosd(alpha);
    sind(alpha) sind(alpha) sind(alpha) sind(alpha)];
allocator.A = A;
Phi = A'/(A*A'); % psuedo inverse
allocator.Phi = Phi;
allo

% New RW mapping if wheel_1 becomes unoperational. column 1 drops out.
temp = A;
temp(:, 1) = [0;0;0];
allocator.A_1 = temp;
allocator.Phi_1 = temp'/(temp*temp');
 
% New RW mapping if wheel_2 becomes unoperational. column 2 drops out.
temp = A;
temp(:, 2) = [0;0;0];
allocator.A_2 = temp;
allocator.Phi_2 = temp'/(temp*temp');
 
% New RW mapping if wheel_3 becomes unoperational. column 3 drops out.
temp = A;
temp(:, 3) = [0;0;0];
allocator.A_3 = temp;
allocator.Phi_3 = temp'/(temp*temp');
 
% New RW mapping if wheel_4 becomes unoperational. column 4 drops out.
temp = A;
temp(:, 4) = [0;0;0];
allocator.A_4 = temp;
allocator.Phi_4 = temp'/(temp*temp');
 

fswParams.allocator = allocator;

clear allocator 
clear alpha A Phi temp
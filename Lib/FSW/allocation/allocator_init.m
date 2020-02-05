% Initialization of the Allocators for the RWA and the MTQ.
% Stores various methods for distributing the total body-axis 
% control command to the available actuators. actuator frame to
% body frames and visa versa.
%
%
% Author: Cole Morgan


allocator = struct;

%%%% RWA Allocation %%%%

alpha = 23; % angle of the reaction wheels

% RWA frame to body frame.
A = [cosd(alpha) 0 -cosd(alpha) 0;
    0 cosd(alpha) 0 -cosd(alpha);
    sind(alpha) sind(alpha) sind(alpha) sind(alpha)];
allocator.RWA_A = A;
temp = A'/(A*A'); % psuedo inverse
allocator.Phi = temp;
% body frame to RWA frame.
allocator.RWA_A_inv = temp;


%%%% MTQ Allocation %%%%


% allocation of MTQ frame to body frame.
B = [1 -1 0 0 0;
    0 0 1 -1 0;
    0 0 0 0 1];
allocator.MTQ_B = B;

temp = B;
% inv allocation from body to MTQ frame.
allocator.MTQ_B_inv = temp'/(temp*temp');
 

fswParams.allocator = allocator;

clear allocator 
clear alpha A Phi temp B 
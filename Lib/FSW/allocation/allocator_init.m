function [fswParams,simParams] = allocator_init(fswParams,simParams)
%ALLOCATOR_INIT
%
% Initialization of the Allocators for the RWA and the MTQ.
% Stores various methods for distributing the total body-axis 
% control command to the available actuators. actuator frame to
% body frames and visa versa.
%
% Author: Cole Morgan & T. P. Reynolds

allocator = struct;

%% Reaction Wheel Assembly

% The rwa struct defined below MUST MATCH the RWA bus definition. Adding
% parameters here without changing that bus definition will cause an error
% in the sim on compile.

% constants
Jw          = simParams.actuators.rwa.inertia;
RPM2RPS     = fswParams.constants.convert.RPM2RPS;
targ_rpm    = fswParams.rwa.targ_rpm;

rwa = struct;

rwa.A               = simParams.actuators.rwa.Aw(1:3,:);
rwa.max_norm_ellipsoid_R = [ 28813; 28813; 79957 ];
rwa.num_facet = uint8(6);
rwa.h_targ_wheel_Nms = RPM2RPS .* ( Jw * targ_rpm );
rwa.feedback_gain = 0.01;

n = 4;
n_pair = 1:n;
pairs  = combnk(1:n,2);
temp   = pairs;
for k = 1:size(pairs,1)
    temp(k,:) = pairs(size(pairs,1)-k+1,:);
end

rwa.id_facet = uint8( pairs );
rwa.id_facet_complement = uint8( temp );
rwa.w_facet = zeros(3,size(pairs,1));
rwa.g_facet = zeros(1,size(pairs,1));
rwa.inrm2   = zeros(1,size(pairs,1));

for p = 1:size(pairs,1)
   ii = pairs(p,1);
   jj = pairs(p,2);
   
   a_hat_i = rwa.A(:,ii);
   a_hat_j = rwa.A(:,jj);
   
   temp = cross(a_hat_i,a_hat_j);
   n_hat_ij = temp./norm(temp);
   
   id_saturated = n_pair;
   id_saturated(pairs(p,:)) = [];
   
   v_ij = zeros(3,1);
   for k = id_saturated
       v_ij = v_ij + sign(dot(rwa.A(:,k),n_hat_ij)) .* rwa.A(:,k);
   end
   
   d_ij = dot(v_ij,n_hat_ij);
   rwa.w_facet(:,p) = (1/d_ij) .* n_hat_ij;
   rwa.g_facet(p)   = dot(n_hat_ij,cross(v_ij,a_hat_j))./norm(temp);
   rwa.inrm2(p)     = 1.0/(norm(temp)^2);
   
end

allocator.rwa = rwa;

% to be removed once allocator fully integrated
allocator.RWA_A = rwa.A;
A = allocator.RWA_A;
allocator.RWA_A_inv = A'/(A*A'); % psuedo inverse

%% Magnetorquers

% to be removed once allocator fully integrated
% allocation of MTQ frame to body frame.
B = [1 -1 0 0 0;
     0 0 1 -1 0;
     0 0 0 0 1];
allocator.MTQ_B = B;

% inv allocation from body to MTQ frame.
allocator.MTQ_B_inv = B'/(B*B');
 
%% attach allocation struct to main struct
fswParams.allocator = allocator;

end
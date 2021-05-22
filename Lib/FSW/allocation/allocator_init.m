function [fswParams,simParams] = allocator_init(fswParams,simParams)
%ALLOCATOR_INIT
%
% Initialization of the Allocators for the RWA and the MTQ.
% Stores various methods for distributing the total body-axis 
% control command to the available actuators. actuator frame to
% body frames and visa versa.
%
% Author: Cole Morgan | T. P. Reynolds

%% Reaction Wheel Assembly

% The rwa struct defined below MUST MATCH the RWA bus definition. Adding
% parameters here without changing that bus definition will cause an error
% in the sim on compile.


% constants
rwa_sim     = simParams.actuators.rwa;
Jw          = rwa_sim.inertia;
RPM2RPS     = fswParams.constants.convert.RPM2RPS;
targ_rpm    = [ 1000; -1000; 1000; -1000 ];
rwa_nullvec = [1;-1;1;-1];

alloc = struct;

alloc.A_wheel2body        = simParams.actuators.rwa.A_wheel2body;
alloc.inertia             = diag(Jw);
alloc.inv_inertia         = diag(eye(rwa_sim.num_wheels)/Jw);
alloc.max_torque_Nm       = rwa_sim.max_torque_Nm;
alloc.max_RPM             = rwa_sim.max_RPM;
alloc.num_facet           = uint8(6);
alloc.h_targ_wheel_Nms    = RPM2RPS .* ( Jw * targ_rpm );
alloc.feedback_gain       = 0.01;
alloc.rwa_nullvec         = rwa_nullvec;


%%%%
% THIS QUANTITY IS HARD CODED IN AND PARTICULAR TO THE 23 DEGREE
% TETRAHEDRAL WHEEL CONFIG WITH 3.2mNm TORQUE PER WHEEL. ANY CHANGES MUST
% TO WHEEL GEOMETRY OR TORQUE LIMITS MUST RERUN THE POLYTOPE_PROJECTION FILE 
% TO UPDATE THESE NUMBERS. USE THE 2nd AND 3rd ENTRIES IN B TO DO SO.
alloc.b_sat   = [ 0.00294561553104781;
                  0.00214403277419873 ];
%%%%%

n = 4;
n_pair = 1:n;
pairs  = combnk(1:n,2);
temp   = pairs;
for k = 1:size(pairs,1)
    temp(k,:) = pairs(size(pairs,1)-k+1,:);
end

alloc.id_facet = uint8( pairs );
alloc.id_facet_complement = uint8( temp );
alloc.w_facet = zeros(3,size(pairs,1));
alloc.g_facet = zeros(1,size(pairs,1));
alloc.inrm2   = zeros(1,size(pairs,1));

W = alloc.A_wheel2body;
for p = 1:size(pairs,1)
   ii = pairs(p,1);
   jj = pairs(p,2);
   
   a_hat_i = W(:,ii);
   a_hat_j = W(:,jj);
   
   temp = cross(a_hat_i,a_hat_j);
   n_hat_ij = temp./norm(temp);
   
   id_saturated = n_pair;
   id_saturated(pairs(p,:)) = [];
   
   v_ij = zeros(3,1);
   for k = id_saturated
       v_ij = v_ij + sign(dot(W(:,k),n_hat_ij)) .* W(:,k);
   end
   
   d_ij = dot(v_ij,n_hat_ij);
   alloc.w_facet(:,p) = (1/d_ij) .* n_hat_ij;
   alloc.g_facet(p)   = dot(n_hat_ij,cross(v_ij,a_hat_j))./norm(temp);
   alloc.inrm2(p)     = 1.0/(norm(temp)^2);
   
end

%% Magnetorquers

% no allocation performed in this FSW
 
%% attach allocation struct to main struct
fswParams.allocator     = alloc;

end
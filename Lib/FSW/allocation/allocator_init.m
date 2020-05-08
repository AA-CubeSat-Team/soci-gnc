% Initialization of the Allocators for the RWA and the MTQ.
% Stores various methods for distributing the total body-axis 
% control command to the available actuators. actuator frame to
% body frames and visa versa.
%
%
% Author: Cole Morgan


allocator = struct;

%%%% RWA Allocation %%%%

%%% OLD STRUCT

% alpha = 23; % angle of the reaction wheels
% 
% % RWA frame to body frame.
% A = [cosd(alpha) 0 -cosd(alpha) 0;
%     0 cosd(alpha) 0 -cosd(alpha);
%     sind(alpha) sind(alpha) sind(alpha) sind(alpha)];
% allocator.RWA_A = A;
% temp = A'/(A*A'); % psuedo inverse
% allocator.Phi = temp;
% % body frame to RWA frame.
% allocator.RWA_A_inv = temp;

%%% NEW STRUCT

Jw = fswParams.actuators.rwa.inertia_matrix;
RPM2RPS = fswParams.constants.convert.RPM2RPS;

rwa = struct;
beta_deg = 23;
cb = cosd(beta_deg);
sb = sind(beta_deg);
rwa.A = [ cb,   0, -cb,   0;
           0,  cb,   0, -cb;
          sb,  sb,  sb,  sb ];
rwa.num_facet = uint8(6);
rwa.h_targ_wheel_Nms = RPM2RPS .* (Jw*[ 1000; -1000; 1000; -1000 ]);
rwa.feedback_gain = 0.1;

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

clearvars -except fswParams simParams TLE RWA
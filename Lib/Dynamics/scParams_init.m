scParams = struct;

% Dimension of cubesat
scParams.z_len  = 0.30; %cm
scParams.x_len  = 0.10; %cm
scParams.y_len  = 0.10; %cm
scParams.m_3u   = 4.00; %kg

% Body normals in the body frame
scParams.xB_dir = [1,0,0];
scParams.yB_dir = [0,1,0];
scParams.zB_dir = [0,0,1];

% Inertia Tensor
scParams.J = [...
     (1/12)*scParams.m_3u*(scParams.z_len^2 + scParams.x_len^2),0,0;
     0,(1/12)*scParams.m_3u*(scParams.x_len^2 + scParams.z_len^2),0;
     0,0,(1/12)*scParams.m_3u*(scParams.y_len^2 + scParams.x_len^2) ];
 
% Point of pressure for S/C and estimated drag coefficent per face
scParams.point_of_pressure = [0.01; 0.02; 0.03];
scParams.CD = 2.2; % standard for 3U cubesat

% Area of the faces of the S/C
scParams.Ax = scParams.x_len * scParams.z_len;
scParams.Ay = scParams.y_len * scParams.z_len;
scParams.Az = scParams.x_len * scParams.y_len;

% Initialize battery model
% battery_init;

simParams.scParams = scParams;
fswParams.scParams = scParams;
clear scParams
 
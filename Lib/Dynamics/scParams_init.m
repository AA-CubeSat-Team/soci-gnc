
scParams = struct;


% Dimension of cubesat
scParams.z_len = .30; %cm
scParams.x_len = .10; %cm
scParams.y_len = .10; %cm
scParams.m_3u = 4; %kg



% Inertia Tensor
scParams.J = [(1/12)*scParams.m_3u*(scParams.z_len^2 + scParams.x_len^2),0,0;
    0,(1/12)*scParams.m_3u*(scParams.x_len^2 + scParams.z_len^2), 0;
     0,0,(1/12)*scParams.m_3u*(scParams.y_len^2 + scParams.x_len^2)];
 
% Point of pressure for S/C
scParams.point_of_pressure = [0.01; 0.02; 0.03];

% Area of the faces of the S/C
scParams.Ax = .003;
scParams.Ay = .003;
scParams.Az = .001;

scParams.Re_km = 6378137.0;




simParams.scParams = scParams;
clear scParams
 

scParams = struct;

% Dimension of cubesat
scParams.z_len = .30; %cm
scParams.x_len = .10; %cm
scParams.y_len = .10; %cm
scParams.m_3u = 4; %kg
scParams.J = [(1/12)*scParams.m_3u*(scParams.z_len^2 + scParams.x_len^2),0,0;
    0,(1/12)*scParams.m_3u*(scParams.x_len^2 + scParams.z_len^2), 0;
     0,0,(1/12)*scParams.m_3u*(scParams.y_len^2 + scParams.x_len^2)];

simParams.scParams = scParams;
clear scParams
 
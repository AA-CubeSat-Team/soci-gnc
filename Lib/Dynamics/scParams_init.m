%% Spacecraft Parameters 
%
% Last sync with SOC-i's CAD model: July 16, 2020

scParams = struct;

% Dimension of cubesat
scParams.z_len  = 0.20; % cm
scParams.x_len  = 0.10; % cm
scParams.y_len  = 0.10; % cm
scParams.m_2u   = 2.565438; % kg

% Body normals in the body frame
scParams.xB_dir = [1,0,0];
scParams.yB_dir = [0,1,0];
scParams.zB_dir = [0,0,1];

% Inertia matrix about the CoM & aligned with the body frame axes. Careful
% to convert the CAD output of g*mm^2 into kg*m^2 by multiplying by 10^-9.
scParams.J = [  11820643.5013,  431707.2662,    -7306.1275;
                431707.2662,    11636351.4485,  -92921.9316;
               -7306.1275,     -92921.9316,      6034584.4268 ] * 1e-9;
 
% Point of pressure for S/C and estimated drag coefficent per face. Assume
% geometric center for now, so use -ve of the CoM's location w.r.t. the
% geometric center
scParams.point_of_pressure = [ 2.1986; 2.4908; -8.0777] * 1e-3; % m
scParams.CD = 2.2; % standard for 3U cubesat

% Area of the faces of the S/C
scParams.Ax = scParams.x_len * scParams.z_len;
scParams.Ay = scParams.y_len * scParams.z_len;
scParams.Az = scParams.x_len * scParams.y_len;

% Residual dipole moment
scParams.res_dipole_Am2 = [ 0.0; 0.0; 0.0 ];

% Initialize battery model
% battery_init;

simParams.scParams = scParams;
fswParams.scParams = scParams;
clear scParams
 
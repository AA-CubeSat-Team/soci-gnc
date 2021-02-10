function soarParams = init_soar_params(fswParams,~)
%INIT_SOAR_PARAMS   SOCi's Optimal Attitude Reorientation Init File
%
% Syntax: soarParams = init_soar_params(fswParams,simParams)
%
%  Load parameters for SOCi's constraint attitude reorientation (SOAR).
%  These are both parameters used in the interface library and variables
%  (or dimensions) used inside the library. The output struct SOAR is used
%  as an input (of type parameter) to both the SOAR_INIT and SOAR_SOLVE
%  functions of the library.
%
%  The build configuration reflects the constraints that are imposed, and
%  any changes to its value must be followed by re-running build_soar.m
%  from the `soar/build/` directory.
%
% T. P. Reynolds

soarParams = struct;
% Initial Conditions
% soarParams.ic.sc_mode             = 0.0;
soarParams.ic.quat_in               = [1;0;0;0];
% soarParams.ic.w_body_radps        = zeros(3,1);
% soarParams.ic.hw_Nms              = zeros(3,1);
soarParams.ic.quat_cmd              = [0.86603;0.28868;0.28868;0.28868];
% soarParams.ic.w_body_cmd_radps    = zeros(3,1);
% soarParams.ic.sun_inertial_unit   = zeros(3,1);
% soarParams.ic.met_epoch_s         = 0.0;
% soarParams.ic.met_time_s          = 0.0;
% soarParams.ic.cmd_torque          = zeros(3,1);
soarParams.ic.cmd_state             = [ soarParams.ic.quat_cmd; 
                                        zeros(3,1); %soar.ic.w_body_cmd_radps;
                                        zeros(3,1); %soar.ic.hw_Nms 
                                      ];

% SOAC configuration %
soarParams.config = 'bie'; % b = baseline, bi = b+inclusion, bie = bi+exclusion
                            
% Number of discretization points
soarParams.N  = 10;
soarParams.dt = 1/(soarParams.N-1);

% defined configuration dependent parameters
switch soarParams.config
    case 'b'
        soarParams.sample_time_s = (1/1)*fswParams.sample_time_s;  % sample time [s]
        soarParams.interp_sample_time_s = fswParams.sample_time_s; % interp sample time [s]
        % problem sizes (must match build_soar.m)
        soarParams.c_size   = int32(332);
        soarParams.Air_size = int32(1278);
        soarParams.Ajc_size = int32(333);
        soarParams.Apr_size = int32(1278);
        soarParams.b_size   = int32(117);
        soarParams.Gir_size = int32(674);
        soarParams.Gjc_size = int32(333);
        soarParams.Gpr_size = int32(674);
        soarParams.h_size   = int32(354);
        soarParams.q_size   = int32(1);
        soarParams.y_size   = int32(334);
        % dimensions of cones
        soarParams.l_dim    = int32(322);
        soarParams.soc_dim  = int32(32);
    case 'bi'
        soarParams.sample_time_s = (1/1)*fswParams.sample_time_s;  % sample time [s]
        soarParams.interp_sample_time_s = fswParams.sample_time_s; % interp sample time [s]
        % problem sizes (must match build_soar.m)
        soarParams.c_size   = int32(332);
        soarParams.Air_size = int32(1278);
        soarParams.Ajc_size = int32(333);
        soarParams.Apr_size = int32(1278);
        soarParams.b_size   = int32(117);
        soarParams.Gir_size = int32(754);
        soarParams.Gjc_size = int32(333);
        soarParams.Gpr_size = int32(754);
        soarParams.h_size   = int32(414);
        soarParams.q_size   = int32(11);
        soarParams.y_size   = int32(334);
        % dimensions of cones
        soarParams.l_dim    = int32(322);
        soarParams.soc_dim  = int32([32;6;6;6;6;6;6;6;6;6;6]);
    case 'bie'
        soarParams.sample_time_s = (1/1)*fswParams.sample_time_s;  % sample time [s]
        soarParams.interp_sample_time_s = fswParams.sample_time_s; % interp sample time [s]
        % problem sizes (must match build_soar.m)
        soarParams.c_size   = int32(332);
        soarParams.Air_size = int32(1278);
        soarParams.Ajc_size = int32(333);
        soarParams.Apr_size = int32(1278);
        soarParams.b_size   = int32(117);
        soarParams.Gir_size = int32(834);
        soarParams.Gjc_size = int32(333);
        soarParams.Gpr_size = int32(834);
        soarParams.h_size   = int32(474);
        soarParams.q_size   = int32(21);
        soarParams.y_size   = int32(334);
        % dimensions of cones
        soarParams.l_dim    = int32(322);
        soarParams.soc_dim  = int32([32;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6]);
    otherwise
        error('INIT_SOAC: undefined configuration')
end

% Parameters %
soarParams.inertia = fswParams.scParams.J;
soarParams.w_max  = 0.1;
soarParams.T_max  = 3.2e-3;
soarParams.s_min  = 15;
soarParams.s_max  = 25;
soarParams.w_v    = 1e2;

% Scalings %
% In MC testing, some issues noticed with these scalings. Omitting them
% until further testing finds the issue.
%
% Commented out scaling matrices as these are now hardcoded in as simple
% identities/zeros. The problem appears to be quite well-scaled naturally
% and does not suffer from a lack of scalings. Also including them
% significantly inflates the number of bytes that soarParams will take up
% in memory.

% soarParams.Dq = eye(4);
% soarParams.Dw = soac.w_max * eye(3);
% soarParams.Dh = 1e-3 * eye(3);
% soarParams.Dx = blkdiag(soac.Dq,soac.Dw,soac.Dh);
% soarParams.iDx = inv(soac.Dx);
% soarParams.Du = soac.T_max * eye(3);
% soarParams.Ds = soac.s_max - soac.s_min;
% soarParams.Dg = 1.0;
% soarParams.DX = kron(eye(soac.N),soac.Dx);
% soarParams.DU = kron(eye(soac.N),soac.Du);

% Dq = eye(4);
% Dw = eye(3);
% Dh = eye(3);
% soarParams.Dx = blkdiag(Dq,Dw,Dh);
% soarParams.iDx = inv(soarParams.Dx);
% soarParams.Du = eye(3);
% soarParams.Ds = 1.0;
% soarParams.Dg = 1.0;
% soarParams.DX = kron(eye(soarParams.N),soarParams.Dx);
% soarParams.DU = kron(eye(soarParams.N),soarParams.Du);

end
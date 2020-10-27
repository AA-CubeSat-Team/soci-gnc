function [fswParams,simParams] = init_soar_params(fswParams,simParams)
%INIT_SOAR_PARAMS   AACT SOCi Optimal Attitude Reorientation Init File
%
% Syntax: [fswParams,simParams] = init_soar_params(fswParams,simParams)
%
%  Load parameters for SOCi's constraint attitude reorientation (SOAR).
%  These are both parameters used in the interface library and variables
%  (or dimensions) used inside the library. The output struct SOAR is used
%  as an input (of type parameter) to both the SOAR_INIT and SOAR_SOLVE
%  functions of the library.
%
%  The build configuration reflects the constraints that are imposed, and
%  any changes to its value must be followed by re-running build_SOAR.m
%  from the `adcs_oac/build/` directory.
%
% T. P. Reynolds

soar = struct;
% Initial Conditions
soar.ic.sc_mode             = 0.0;
soar.ic.quat_in             = [1;0;0;0];
soar.ic.w_body_radps        = zeros(3,1);
soar.ic.hw_Nms              = zeros(3,1);
soar.ic.quat_cmd            = [0.86603;0.28868;0.28868;0.28868];
soar.ic.w_body_cmd_radps    = zeros(3,1);
soar.ic.sun_inertial_unit   = zeros(3,1);
soar.ic.met_epoch_s         = 0.0;
soar.ic.met_time_s          = 0.0;
soar.ic.cmd_torque          = zeros(3,1);
soar.ic.cmd_state           = [ soar.ic.quat_cmd; soar.ic.w_body_cmd_radps;
                                soar.ic.hw_Nms ];

% SOAC configuration
soar.config = 'bie'; % b = baseline, bi = b+inclusion, bie = bi+exclusion
                            
% Number of discretization points
soar.N  = 10;
soar.dt = 1/(soar.N-1);

% defined configuration dependent parameters
switch soar.config
    case 'b'
        soar.sample_time_s = (1/10); % sample time [s]
        soar.interp_sample_time_s = (1/10); % interp sample time [s]
        % problem sizes (must match build_soac.m)
        soar.c_size   = 332;
        soar.Air_size = 1278;
        soar.Ajc_size = 333;
        soar.Apr_size = 1278;
        soar.b_size   = 117;
        soar.Gir_size = 674;
        soar.Gjc_size = 333;
        soar.Gpr_size = 674;
        soar.h_size   = 354;
        soar.q_size   = 1;
        soar.y_size   = 334;
        % dimensions of cones
        soar.l_dim    = 322;
        soar.soc_dim  = 32;
    case 'bi'
        soar.sample_time_s = (1/10); % sample time [s]
        soar.interp_sample_time_s = (1/10); % interp sample time [s]
        % problem sizes (must match build_soac.m)
        soar.c_size   = 332;
        soar.Air_size = 1278;
        soar.Ajc_size = 333;
        soar.Apr_size = 1278;
        soar.b_size   = 117;
        soar.Gir_size = 754;
        soar.Gjc_size = 333;
        soar.Gpr_size = 754;
        soar.h_size   = 414;
        soar.q_size   = 11;
        soar.y_size   = 334;
        % dimensions of cones
        soar.l_dim    = 322;
        soar.soc_dim  = [32;6;6;6;6;6;6;6;6;6;6];
    case 'bie'
        soar.sample_time_s = (1/10); % sample time [s]
        soar.interp_sample_time_s = (1/10); % interp sample time [s]
        % problem sizes (must match build_soac.m)
        soar.c_size   = 332;
        soar.Air_size = 1278;
        soar.Ajc_size = 333;
        soar.Apr_size = 1278;
        soar.b_size   = 117;
        soar.Gir_size = 834;
        soar.Gjc_size = 333;
        soar.Gpr_size = 834;
        soar.h_size   = 474;
        soar.q_size   = 21;
        soar.y_size   = 334;
        % dimensions of cones
        soar.l_dim    = 322;
        soar.soc_dim  = [32;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6;6];
    otherwise
        error('INIT_SOAC: undefined configuration')
end

% Parameters
soar.inertia = fswParams.scParams.J;
soar.w_max  = 0.1;
soar.T_max  = 3.2e-3;
soar.s_min  = 15;
soar.s_max  = 25;
soar.w_v    = 1e2;

% Scalings
% In MC testing, some issues noticed with these scalings. Omitting them
% until further testing finds the issue.
% soac.Dq = eye(4);
% soac.Dw = soac.w_max * eye(3);
% soac.Dh = 1e-3 * eye(3);
% soac.Dx = blkdiag(soac.Dq,soac.Dw,soac.Dh);
% soac.iDx = inv(soac.Dx);
% soac.Du = soac.T_max * eye(3);
% soac.Ds = soac.s_max - soac.s_min;
% soac.Dg = 1.0;
% soac.DX = kron(eye(soac.N),soac.Dx);
% soac.DU = kron(eye(soac.N),soac.Du);

soar.Dq = eye(4);
soar.Dw = eye(3);
soar.Dh = eye(3);
soar.Dx = blkdiag(soar.Dq,soar.Dw,soar.Dh);
soar.iDx = inv(soar.Dx);
soar.Du = eye(3);
soar.Ds = 1.0;
soar.Dg = 1.0;
soar.DX = kron(eye(soar.N),soar.Dx);
soar.DU = kron(eye(soar.N),soar.Du);

% add to main struct
fswParams.soar = soar;

end
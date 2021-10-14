% Soar Analysis Test Init File
%
% This file is a wrapper around the SOAR interface unit test that compares
% attitude control error for different SOAR, sensor, and actuator
% parameters/settings.
%
% Nick Melville -- RAIN Lab

%% Initialize sim 
init_params

%% Randomization Initialization
seed    = 1;
rng(seed)                           % for repeatability of random ICs
N_mc    = 10;                      % number of monte carlo trials
var_ang = 90;                       % variance of Euler angle error at init
var_w   = [ 1e-3; 1e-3; 1e-3 ];     % variance of angular vel. at init
var_hw  = [ 50; 50; 50; 50 ];       % variance of wheel RPMs at init


%% Set Analysis Parameters Here
discretizations_test = 4;
ecos_tolerance_test = 1E-3;
ecos_iterations_test = 20;
ake_variance = 5; % degrees
actuator_settling_time = 1;
actuator_damping_ratio = 1;

%% Nominal Paremeters
discretizations_nom = 12;
ecos_tolerance_nom = 1E-12;
ecos_iterations_nom = 1000;

%% Data storage
success_test = false(1,N_mc);

%% Setup Sim
set(0,'defaulttextinterpreter','latex','defaultAxesFontSize',12)

run_time    = 60;              % must be larger than soar_params.s_max;
mdl         = 'soar_analysis_model';
load_system(mdl);
set_param(mdl,'StopTime', num2str(run_time));

%% Print some nice things
fprintf('========================================\n')
fprintf('SOAR MONTE CARLO TEST : %d TRIALS\n\n',mc.info.N_mc)

%% Initial trajectory
% Needed only to calculate the sizes of Air and Gir



%% Initialize Nominal Soar Params
N = discretizations_nom;
c_size      = 33*N + 2;
Air_size    = 5000;
Ajc_size    = c_size + 1;
Apr_size    = Air_size;
b_size      = 12*N - 3;
Gir_size    = 5000;
Gjc_size    = c_size + 1;
Gpr_size    = Gir_size;
h_size      = (4*3*N + 2 + 2*10*N) + 32 + (6*2*N);
q_size      = 2*N + 1; 
y_size      = c_size + 1; %Is this right?
%% Build Soar With Nominal Parameters
def = legacy_code('initialize');
def.SFunctionName = 'sfun_ecos';
def.IncPaths = {'../include/ecos/include'};
def.SrcPaths = {'../include/ecos/src'};
def.SourceFiles = {'matlab_main.c','cone.c','ctrlc.c','ecos.c',...
                   'equil.c','expcone.c','kkt.c','preproc.c','spla.c',...
                   'splamm.c','wright_omega.c','ldl.c','amd_1.c',...
                   'amd_2.c','amd_aat.c','amd_control.c','amd_defaults.c',...
                   'amd_dump.c','amd_global.c','amd_info.c','amd_order.c',...
                   'amd_post_tree.c','amd_postorder.c','amd_preprocess.c','amd_valid.c'};
def.HeaderFiles = {'ecos.h'};
def.OutputFcnSpec = ['callecos('...
                     'int32 u1,'...                          % int n
                     'int32 u2,'...                          % int m
                     'int32 u3,'...                          % int p
                     'int32 u4,'...                          % int l
                     'int32 u5,'...                          % int ncones
                     'double u6[' num2str(c_size) '],'...    % double *c
                     'int32 u7[' num2str(Gjc_size) '],'...   % double *Gjc
                     'int32 u8[' num2str(Gir_size) '],'...   % double *Gir
                     'double u9[' num2str(Gpr_size) '],'...  % double *Gpr
                     'double u10[' num2str(h_size) '],'...   % double *h
                     'int32 u11[' num2str(q_size) '],'...    % int *q
                     'int32 u12[' num2str(Ajc_size) '],'...  % int *Ajc
                     'int32 u13[' num2str(Air_size) '],'...  % int *Air
                     'double u14[' num2str(Apr_size) '],'... % double *Apr
                     'double u15[' num2str(b_size) '],'...   % double *b
                     'double y1[' num2str(y_size) '])'];     % double *y

% Compile MEX
legacy_code('generate_for_sim',def);
    
%% Run Nominal MC Test
for mc_iter = 1:N_mc
    
    ax       = randn(3,1);
    ax       = ax./norm(ax);
    ang      = -var_ang + 2*var_ang*rand(1);
    quat_in  = [ cosd(ang/2); sind(ang/2).*ax ];
    omega_in = zeros(3,1) + var_w.*randn(3,1);
    Om0      = [ 1000; -1000; 1000; -1000 ] + var_hw.*randn(4,1);  % initial wheel RPM
    hw_in    = Aw * Jw * (RPM2RADPS * Om0); % initial wheel momentum
    
    simParams.dynamics.ic.quat_init                = quat_in;
    simParams.dynamics.ic.rate_init                = omega_in;
    simParams.actuators.reaction_wheel.ic.rpm      = Om0;
    fswParams.control.cmd_processing.ic.momentum   = hw_in;
    
    % set nominal parameters
    soarParams.N = discretizations_nom;
    

    % run nominal case
    sim(mdl);
    
    % extract desired results
    %slv_itr = find(trigger,1);
    %soar_end_itr = slv_itr + soarParams.s_max / fswParams.sample_time_s;
    trajectory_nom = sc_quat;
    
    success_test(mc_iter) = (soar_telemetry_out.exitcode.Data(slv_itr,17)==0);
    
    fprintf('Trial %04d | Success = %01d\n',...
                    mc_iter,success_test(mc_iter))
end




% Monte Carlo test init file
%
% This file is a wrapper around the SOAR interface unit test that runs a
% Monte Carlo test, crunches some data and outputs plots.
%
% T. Reynolds -- RAIN Lab
set(0,'defaulttextinterpreter','latex','defaultAxesFontSize',12)

% Monte Carlo parameters
seed    = 2;
rng(seed)                           % for repeatability of random ICs
N_mc    = 10;                       % number of monte carlo trials
var_ang = 90;                       % variance of Euler angle error at init
var_w   = [ 1e-3; 1e-3; 1e-2 ];     % variance of angular vel. at init
var_hw  = [ 50; 50; 50; 50 ];       % variance of wheel RPMs at init

mc = struct;
mc.info.N_mc = N_mc;  
mc.info.seed = seed;
mc.info.var_ang = var_ang;
mc.info.var_w = var_w;
mc.info.var_hw = var_hw;
mc.x_ic = cell(1,N_mc);
mc.success  = zeros(1,N_mc);
mc.exitcode = cell(1,N_mc);
% mc.x_opt = cell(1,N_mc);
% mc.u_opt = cell(1,N_mc);
% mc.s_opt = cell(1,N_mc);
mc.deg_err = cell(1,N_mc);
mc.ic_err  = zeros(1,N_mc);
mc.fc_err  = zeros(1,N_mc);
mc.slv_time = cell(1,N_mc);
mc.tot_slv_time = zeros(1,N_mc);
mc.iters = zeros(1,N_mc);

% constants
w_max   = soarParams.w_max;
T_max   = soarParams.T_max;
hw_max  = [ 37; 37; 31.3 ] * 1e-3; % Nms
Jw      = simParams.actuators.rwa.inertia;
Aw      = simParams.actuators.rwa.A_wheel2body;
J       = soarParams.inertia;
RPM2RADPS = fswParams.constants.convert.RPM2RPS;
sc_mode   = 8;
MET_epoch = simParams.time.epoch_utc_s;

% final conditions
quat_cmd    = [ 1.0; 0.0; 0.0; 0.0 ];
omega_cmd   = [ 0.0; 0.0; 0.0 ];

% inertial sun vector
sI_unit  = [ 1.0; 0.0; 0.0 ];
mc.info.sI_unit = sI_unit;

% initialize plots
close all
f1 = figure(1);
subplot(3,2,[1 2]), hold on, grid on, box on
plot([0 60],[quat_cmd(1) quat_cmd(1)],'r--','LineWidth',1)
set(gca,'Ylim',[-1.2 1.2])
xlabel('Time [s]','FontSize',16)
title('Closed-loop attitude quaternion (scalar part)','FontSize',16)
subplot(3,2,[3 4]), hold on, grid on, box on
plot([0 60],[w_max w_max],'r--','LineWidth',1)
plot([0 60],[-w_max -w_max],'r--','LineWidth',1)
set(gca,'Ylim',[-0.12 0.12])
xlabel('Time [s]','FontSize',16)
title('Closed-loop angular velocity','FontSize',16)
subplot(3,2,5), hold on, grid on, box on
plot([0 60],[hw_max(1:2) hw_max(1:2)],'r--','LineWidth',1)
plot([0 60],[-hw_max(1:2) -hw_max(1:2)],'r--','LineWidth',1)
set(gca,'Ylim',[-50e-3 50e-3])
xlabel('Time [s]','FontSize',16)
title('CMD RW Momentum (X/Y)','FontSize',16)
subplot(3,2,6), hold on, grid on, box on
plot([0 60],[hw_max(3) hw_max(3)],'r--','LineWidth',1)
plot([0 60],[-hw_max(3) -hw_max(3)],'r--','LineWidth',1)
set(gca,'Ylim',[-50e-3 50e-3])
xlabel('Time [s]','FontSize',16)
title('CMD RW Momentum (Z)','FontSize',16)
set(gcf,'Position',[875,51,560,754])

f2 = figure(2); hold on, grid on, box on
plot([0 60],[T_max T_max],'r--','LineWidth',1)
plot([0 60],[-T_max -T_max],'r--','LineWidth',1)
xlabel('Time [s]','FontSize',16)
title('Feedforward Control Signals','FontSize',16)
set(gcf,'Position',[1,51,560,754])

%% loop through test cases
fprintf('========================================\n')
fprintf('SOAR MONTE CARLO TEST : %d TRIALS\n\n',mc.info.N_mc)
% Load sim and set run time
run_time    = 60;              % must be larger than soar_params.s_max;
mdl         = 'soar_interface_unit_test';
load_system(mdl);
set_param(mdl,'StopTime', num2str(run_time));

for mc_iter = 1:N_mc

    % initial conditions
    ax       = randn(3,1);
    ax       = ax./norm(ax);
    ang      = -var_ang + 2*var_ang*rand(1);
    quat_in  = [ cosd(ang/2); sind(ang/2).*ax ];
    omega_in = zeros(3,1) + var_w.*randn(3,1);
    Om0      = [ 1000; -1000; 1000; -1000 ] + var_hw.*randn(4,1);  % initial wheel RPM
    hw_in    = Aw * Jw * (RPM2RADPS * Om0); % initial wheel momentum
  
    % overwrite internal parameters for the simulation
    simParams.dynamics.ic.quat_init                = quat_in;
    simParams.dynamics.ic.rate_init                = omega_in;
    simParams.actuators.reaction_wheel.ic.rpm      = Om0;
    fswParams.control.cmd_processing.ic.momentum   = hw_in;

    % run test case
    sim(mdl);

    % extract desired results
    slv_itr = find(trigger,1);
    soar_end_itr = slv_itr + soarParams.s_max / fswParams.sample_time_s;
    xf      = command_state(end,:);
    qf      = xf(1:4);
    qerr    = quatmultiply(quatconj(qf),quat_cmd');
    wf      = xf(5:7);
    hwf     = xf(8:10);
    
    mc.x_ic{mc_iter} = [ quat_in; omega_in; hw_in ];
    mc.exitcode{mc_iter} = soar_telemetry_out.exitcode.Data(slv_itr,:);
    mc.success(mc_iter) = (soar_telemetry_out.exitcode.Data(slv_itr,17)==0);
    % mc.x_opt{mc_iter} = command_state;
    % mc.u_opt{mc_iter} = command_torque;
    % mc.s_opt{mc_iter} = soar_telemetry.s.Data(1);
    mc.deg_err{mc_iter} = err_deg;
    mc.ic_err(mc_iter)  = ang;
    mc.fc_err(mc_iter)  = err_deg(soar_end_itr);
    mc.iters(mc_iter)   = soar_telemetry_out.exitcode.Data(slv_itr,16);

    % update plots
    figure(1)
    subplot(3,2,[1 2]), hold on
    plot(tout,sc_quat(:,1),'LineWidth',1)
    %
    subplot(3,2,[3 4]), hold on, grid on
    plot(tout,body_rates_radps(:,1),'LineWidth',1)
    %
    subplot(3,2,5), hold on, grid on
    plot(tout,command_state(:,8:9),'LineWidth',1)
    %
    subplot(3,2,6), hold on, grid on
    plot(tout,command_state(:,10),'LineWidth',1)

    figure(2), hold on
    plot(tout,command_torque,'LineWidth',1)
    
    fprintf('Trial %04d | exitcode = %02d\n',...
                    mc_iter,mc.exitcode{mc_iter}(11))

end

%% post process 

N_fail = N_mc - nnz(mc.success);

fprintf('\n========================================\n')
fprintf('RESULTS\n\n')
fprintf('Number of successful trials: %04d / %04d\n',sum(mc.success),N_mc)
fprintf('Number of failed trials:     %04d / %04d\n',N_fail,N_mc)
fprintf('\n========================================\n')
if (N_fail>0)
    fprintf(' Failed trials:\n')
    fld_itrs = find(~mc.success);
    for k = 1:N_fail
        f_itr = slv_itr + soarParams.s_max / fswParams.sample_time_s;
        fprintf(' trial: %02u | ic_err = %05.2f deg | fc_err = %05.2f deg | exitcode = %02d\n',...
            fld_itrs(k),mc.ic_err(fld_itrs(k)),...
            mc.fc_err(fld_iters(k)),mc.exitcode{fld_itrs(k)}(11))
    end
else
    fprintf(' >> Success! <<\n')
end

% update plots
figure(1)
subplot(3,2,[1 2]), hold on
plot([tout(slv_itr) tout(slv_itr)],get(gca,'Ylim'),'k:','LineWidth',1)
plot([tout(slv_itr)+soarParams.s_max tout(slv_itr)+soarParams.s_max],...
    get(gca,'Ylim'),'k:','LineWidth',1)
%
subplot(3,2,[3 4]), hold on, grid on
plot([tout(slv_itr) tout(slv_itr)],get(gca,'Ylim'),'k:','LineWidth',1)
plot([tout(slv_itr)+soarParams.s_max tout(slv_itr)+soarParams.s_max],...
    get(gca,'Ylim'),'k:','LineWidth',1)
%
subplot(3,2,5), hold on, grid on
plot([tout(slv_itr) tout(slv_itr)],get(gca,'Ylim'),'k:','LineWidth',1)
plot([tout(slv_itr)+soarParams.s_max tout(slv_itr)+soarParams.s_max],...
    get(gca,'Ylim'),'k:','LineWidth',1)
%
subplot(3,2,6), hold on, grid on
plot([tout(slv_itr) tout(slv_itr)],get(gca,'Ylim'),'k:','LineWidth',1)
plot([tout(slv_itr)+soarParams.s_max tout(slv_itr)+soarParams.s_max],...
    get(gca,'Ylim'),'k:','LineWidth',1)

figure(2), hold on
plot([tout(slv_itr) tout(slv_itr)],get(gca,'Ylim'),'k:','LineWidth',1)
plot([tout(slv_itr)+soarParams.s_max tout(slv_itr)+soarParams.s_max],...
    get(gca,'Ylim'),'k:','LineWidth',1)

figure(3), clf
subplot(2,1,1), hold on, grid on, box on
ic_edges = -var_ang:10:var_ang;
ic_nbins = numel(ic_edges) + 1;
h1           = histogram(mc.ic_err,ic_edges);
% h1.BinEdges  = h1.BinEdges + h1.BinWidth/2; % center
h1.FaceAlpha = 0.9;
h1.EdgeColor = 'k';
set(gca,'XTick',ic_edges)
set(gca,'Xlim',[-var_ang-5 var_ang+5])
xlabel('Initial Euler Angle Error [deg]','FontSize',16)
ylabel('Number of Trials','FontSize',16)
subplot(2,1,2), hold on, grid on, box on
y_data = mc.fc_err;
fc_edges = 0:0.25:ceil(max(y_data));
fc_nbins = numel(fc_edges) + 1;
h2           = histogram(y_data,fc_edges);
% h2.BinEdges  = h2.BinEdges + h2.BinWidth/2; % center
h2.FaceAlpha = 0.9;
h2.EdgeColor = 'k';
hax = gca;
hax.XAxis.MinorTick = 'on';
hax.XAxis.MinorTickValues = fc_edges;
set(gca,'XTick',0:0.5:ceil(max(y_data)))
set(gca,'Xlim',[0 ceil(max(y_data))])
xlabel('Final Euler Angle Error [deg]','FontSize',16)
ylabel('Number of Trials','FontSize',16)

figure(4), hold on, grid on, box on
plot(mc.ic_err,y_data,'ko','MarkerFaceColor','k','MarkerSize',3)
xlabel('Initial Angle Error [deg]','FontSize',16)
ylabel('Final Angle Error [deg]','FontSize',16)


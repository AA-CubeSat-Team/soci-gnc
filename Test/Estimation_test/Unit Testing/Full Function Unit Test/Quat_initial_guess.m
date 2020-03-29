clc
close all
clearvars -except fswParams simParams TLE
warning('off','all')
warning

set_param('UnitTestDebug','FastRestart','on')

% Define Parameters
tfinal = 60;
dt = fswParams.sample_time_s;
t = 0:dt:tfinal;
L = length(t);
converge_time = 50;

% Number of iterations
num_omega = 10; %number of omega Vectors to try
num_err = 10; %number of starting error values to try

simParams.initialConditions.q0 = [1 0 0 0]';
q0_sim = mat2str(simParams.initialConditions.q0);
set_param( 'UnitTestDebug/quat_propagation/Discrete-Time Integrator', ...
    'InitialCondition', q0_sim)

% Allocate Space for Loop-built matrices
Mag_err = zeros(1,L);      q0_error = zeros(1,L);    
q0_minus_error = zeros(num_err,L);       Settling_time = zeros(1,num_err); 
quat_init = zeros(4,num_err);       start_error_angle = zeros(1,num_err);   
settling_time = zeros(1,num_err);     sett_time = zeros(3,num_err);
omega = zeros(3,num_omega);



x = linspace(0,pi/2,num_err);
q0 = sin(x);
q1 = cos(x);
for j = 1:num_err %set up initial error vectors
    quat_init(1,j) = q0(j); 
    quat_init(2,j) = q1(j); 
end

o1 = linspace(1,2000,num_omega);
o = 0.0001*o1;
for p = 1:num_omega %set up omega vectors to try
    omega(1,p) = randn*o(p)*(-1)^randi(2);
   omega(2,p) = randn*o(p)*(-1)^randi(2);
   omega(3,p) = randn*o(p)*(-1)^randi(2);
   
   norm_omega(1,p) = round(norm(omega(:,p),2),5);
end

% figure
% plot(o1,norm_omega*180/pi)
% omega = [[-0.003;0.02;0.01],[-0.05;0.1;0.1],[-0.07;0.12;0.5]];


tic
for w = 1:num_omega
    for k = 1:num_err
        
        s = mat2str([quat_init(:,k)]);
        w1 = mat2str([omega(:,w)]);
        
        
        set_param( 'UnitTestDebug/MEKF_lib/Unit Delay2', 'InitialCondition', s) %these vary the initial quaternion each iteration
        set_param( 'UnitTestDebug/Omega', 'Value',w1) %varies the angular velo each iteration
        
        
        simOut = sim('UnitTestDebug'); % run the sim
        
                qtrue = simOut.my_qtrue.Data'; %get out data from sim
                qest = simOut.my_qest.Data';
                q_init_est = simOut.my_qest_init.Data';
                q0_err = simOut.q0_error.Data';
        
        att_error = (simOut.qerr.Data')*2*180/pi;% these are the attitude angle errors that correspond to the 3 sigma bounds errors
        
        %Get Settling Times
        for c = 2:4
            sett_time(c-1,k) = set_time(att_error(c,:),converge_time,dt,t);
        end
        
        maximum = max(sett_time,[],1);
        [row_not_converged,col_not_converged] = find(sett_time == -1);
        [row_converged,col_converged] = find(sett_time ~= -1);
        settling_time(1,col_not_converged) = -1;
        settling_time(1,col_converged) = maximum(col_converged);
        
        for i = 1:L
            q0_error(k,i) = norm(2*acos(qtrue(1,i)) - 2*acos(qest(1,i)),2)*180/pi;
            q0_minus_error(k,i) = norm(2*acos(qtrue(1,i)) - 2*acos(q_init_est(1,i)),2)*180/pi;
            start_error_angle(:,k) = q0_minus_error(k,1);
        end
        
    end
    toc
    
    flag = -0.1;
    above_conv_time = (settling_time<flag);
    converged = settling_time;
    not_converged = settling_time;
    converged(above_conv_time) = NaN;
    not_converged(~above_conv_time) = NaN;
    
    Purple = [51;0;111]/norm([51;0;111]);
    Gold = [145 123 76]'/norm([145 123 76]');
    
    figure
    hold on
    h1 = plot(start_error_angle,converged,'o','color',Purple);
    h4 = plot(start_error_angle,not_converged,'rx','MarkerSize',10);
    h = [h1;h4];
    legend(h,['Estimate Converged in <',num2str(converge_time),'s'],...
        ['Estimate Not Converged in <',num2str(converge_time),'s'],...
        'Location','northwest') % need to plot xs for the other quat values
    set(h1, 'markerfacecolor', get(h1, 'color'))
    xlim([0,max(start_error_angle) + 5])
    ylim([-2,inf])
    grid on
    ax = gca;
    ax.GridColor = Gold;
    ax.GridAlpha = 1;
    xlabel('Starting \theta error (deg)')
    ylabel('Settling Time to Within 3.5 deg Error')
    title(['Initial Quaternion Error and Convergence Time,||\omega|| = '...
        ,mat2str(norm_omega(:,w)), 'rad/s'])
    
end

tout = simOut.tout;
figure;

grid on;
subplot(2,2,1)
title('constant \omega = [-0.1;0.2;0.12]')
hold on
plot(tout,simOut.my_qtrue.Data(:,1),'k','Linewidth',1.25)
plot(tout,simOut.my_qest.Data(:,1),'m--','Linewidth',1.25)
legend('q1 true', 'q1 est')
grid on;
hold off

subplot(2,2,2)
hold on
plot(tout,simOut.my_qtrue.Data(:,2),'k','Linewidth',1.25)
plot(tout,simOut.my_qest.Data(:,2),'m--','Linewidth',1.25)
legend('q2 true', 'q2 est')
grid on;
hold off

subplot(2,2,3)
hold on
plot(tout,simOut.my_qtrue.Data(:,3),'k','Linewidth',1.25)
plot(tout,simOut.my_qest.Data(:,3),'m--','Linewidth',1.25)
legend('q3 true', 'q3 est')
grid on;
hold off

subplot(2,2,4)
hold on
plot(tout,simOut.my_qtrue.Data(:,4),'k','Linewidth',1.25)
plot(tout,simOut.my_qest.Data(:,4)','m--','Linewidth',1.25)
legend('q4 true', 'q4 est')
grid on;
hold off

clc
close all
clearvars -except fswParams simParams TLE
warning('off','all')
warning

set_param('UnitTestDebug','FastRestart','on')
r_sun_inertial = [1;0;0];
r_sun = mat2str(r_sun_inertial);
set_param( 'UnitTestDebug/r_sun_inertial','Value', '[1;0;0]')
dt = fswParams.sample_time_s;t_eclipse = 1900;
tfinal = t_eclipse + 30*60 + 1900;
t = 0:dt:tfinal;
L = length(t);

% Define Parameters

eclipse_start_time = num2str(t_eclipse);
t_eclipse_end = t_eclipse+30*60+dt;
eclipse_end_time = num2str(t_eclipse_end);

set_param( 'UnitTestDebug/Eclipse_time', 'Time', eclipse_start_time) 
set_param( 'UnitTestDebug/Eclipse_end', 'Time', eclipse_end_time) 


% Number of iterations
num_omega = 1; %number of omega Vectors to try

simParams.initialConditions.q0 = [0 1/sqrt(2) 1/sqrt(2) 0]';
q0_sim = mat2str(simParams.initialConditions.q0);
set_param( 'UnitTestDebug/quat_propagation/Discrete-Time Integrator', ...
    'InitialCondition', q0_sim)
set_param( 'UnitTestDebug/sun_valid', 'Value', '0') 
set_param( 'UnitTestDebug/MEKF_lib/Unit Delay2', 'InitialCondition', q0_sim) %Set initial quat to true quat value

g = (0:1.5:9)*pi/180;
g(1) = 0.29*pi/180;
g = g(1);
num_omega = length(g);
num_omega = 100;
for p = 1:num_omega %set up omega vectors (these range from 0.5 deg/s to 15.5 deg/s (9 deg/s in each axis) in magnitude
    omega(1,p) = (randn/800+g(1))*(-1)^randi(2);
   omega(2,p) = (randn/800+g(1))*(-1)^randi(2);
   omega(3,p) = (randn/800+g(1))*(-1)^randi(2);
   
   norm_omega(1,p) = round(norm(omega(:,p),2)*180/pi,2); %get into deg/s
end

%      rng(0,'twister')
% a = -0.002;
% b = 0.002;
% mag = 0.5*pi/180;
% for k = 1:1
%     
% u = (b-a).*rand(1,1) + a;
% v = (b-a).*rand(1,1) + a;
% 
% w = sqrt(mag^2 - (u^2 + v^2));
% omega(:,k) = [u;v;w];
% norm_omega(1,k) = round(norm(omega(:,k),2)*180/pi,2);%get into deg/s
% % norm_q(:,k) = norm(quat(:,k));
% end


 for w = 1:num_omega
        w1 = mat2str(omega(:,w));
        
        set_param( 'UnitTestDebug/Omega', 'Value',w1) %varies the angular velo each iteration
        simOut = sim('UnitTestDebug'); % run the sim
        
                qtrue = simOut.my_qtrue.Data'; %get out data from sim
                qest = simOut.my_qest.Data';
                q0_err = simOut.q0_error.Data';
                sun_bodytrue = simOut.sun_body_true.Data';
       
      att_error = (simOut.qerr.Data');% these are the attitude angle errors that correspond to the 3 sigma bounds errors
        
        for m = 1:L
            theta(w,m) = 2*acosd(att_error(1,m));
            if theta(w,m) >180
                theta(w,m) = 360-theta(w,m);
            end
        end

    
    Purple = [51;0;111]/norm([51;0;111]);
    Gold = [145 123 76]'/norm([145 123 76]');
    om_max = max(abs(norm_omega));
    om_plusminus = (om_max-0.5);
%     figure
% t = t./60;
    hold on
    p1 = plot(t,theta(w,:),'color',Purple);
    p2 = plot(t,ones(length(t),1)*3.5,'r','LineWidth',1.5);
    xline(t_eclipse,'-k',{'Eclipse Start'});
    xline(t_eclipse,'-k','LineWidth',2);
    xline(t_eclipse_end,'-k',{'Eclipse End'});
     xline(t_eclipse_end,'-k','Linewidth',2);
     h = [p1;p2];
       hleg1 = legend(h,['Att. Error (deg)'],...
        ['3.5 deg']); 
     set(p1, 'markerfacecolor', get(p1, 'color'))
    set(hleg1,'Location','west')
   
% legend('Pointing Error (deg)','Location','northwest') % need to plot xs for the other quat values
    grid on
    ax = gca;
    ax.GridColor = Gold;
    ax.GridAlpha = 0.55;
    xlabel('Time (min)')
    xt = round([0:9.3*2:93.3],0);
    xt(end) = 93.33;
set(gca,'XTick',0:560*2:5600)
set(gca,'XTickLabel',xt)
    ylabel('Attitude Error Error (deg)')
%     title(['Attitude Propagation-Only Error,||\omega|| = '...
%         ,mat2str(norm_omega(:,w)), 'deg/s'])
     title(['Attitude Propagation-Only Error,||\omega|| = 0.5',char(177) num2str(om_plusminus),' deg/s'])
end
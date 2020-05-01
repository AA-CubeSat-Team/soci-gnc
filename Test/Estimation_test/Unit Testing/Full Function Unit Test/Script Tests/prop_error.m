
clc
close all
clearvars -except fswParams simParams TLE
warning('off','all')
warning

fswParams.sample_time_s = 1/10; %set all sample times the same
dt = fswParams.sample_time_s;
% simParams.sensors.sample_time_s = dt;
% simParams.sample_time_s = dt;
% simParams.sensors.gyro.sample_time_s = dt;
% simParams.sensors.mag.sample_time_s = dt; 
% simParams.sensors.sun_sensor.sample_time_s = dt;
% simParams.actuators.sample_time_s = dt;
% simParams.magField.sample_time_s = dt;
% fswParams.actuators.sample_time_s = dt;

set_param('my_sim','FastRestart','on')
dt = fswParams.sample_time_s;t_eclipse = 1900;
tfinal = t_eclipse + 30*60 + 1900;
t = 0:dt:tfinal;
L = length(t);

% Define Parameters

eclipse_start_time = num2str(t_eclipse);
t_eclipse_end = t_eclipse+30*60+dt;
eclipse_end_time = num2str(t_eclipse_end);

set_param( 'my_sim/Subsystem1/Eclipse_time', 'Time', eclipse_start_time) %set eclipse start time
set_param( 'my_sim/Subsystem1/Eclipse_end', 'Time', eclipse_end_time)  %set eclipse end time


% Number of iterations
%%%%%%%%%%%%
%%%%%%%%%%%%
num_omega = 1; %number of omega Vectors to try

simParams.initialConditions.q0 = [0 1/sqrt(2) 1/sqrt(2) 0]';
q0_sim = mat2str(simParams.initialConditions.q0);
set_param( 'my_sim/satelliteDynamics_lib/quat_propagation/Integrator', ...
            'InitialCondition', q0_sim)
% set_param( 'UnitTestDebug/sun_valid', 'Value', '0') 
set_param( 'my_sim/MEKF_lib/Unit Delay2', 'InitialCondition', q0_sim) %Set initial quat to true quat value


mag_deg = 15.5; %here is desired angular velo magnitude
mag = mag_deg*pi/180;
for k = 1:num_omega
    
[x,~] = randfixedsum(3,1,mag^2,0,10);
omega(1,k) = sqrt(x(1))*(-1)^randi(2);
omega(2,k) = sqrt(x(2))*(-1)^randi(2);
omega(3,k) = sqrt(x(3))*(-1)^randi(2);
norm_omega(1,k) = round(norm(omega(:,k),2)*180/pi,2);%get into deg/s
% omega = 0*omega;
end


 for w = 1:num_omega
        w1 = mat2str(omega(:,w));
        set_param( 'my_sim/satelliteDynamics_lib/RigidBodyDynamics/wint', 'InitialCondition', w1)
%         set_param( 'UnitTestDebug/Omega', 'Value',w1) %varies the angular velo each iteration
        simOut = sim('my_sim'); % run the sim
        
                qtrue = simOut.q_true.Data'; %get out data from sim
                qest = simOut.my_qest.Data';
                q0_err = simOut.q_initial_error.Data';
%                 sun_bodytrue = simOut.sun_body_true.Data';
       
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
    om_plusminus = ((om_max-norm_omega)/norm_omega)*100;

    hold on
    p1 = plot(t,theta(w,:),'color',Purple);
    p2 = plot(t,ones(length(t),1)*3.5,'r','LineWidth',1.25);
    
     set(p1, 'markerfacecolor', get(p1, 'color'))
   set(0,'DefaultLegendAutoUpdate','off')
    grid on
    ax = gca;
    ax.GridColor = Gold;
    ax.GridAlpha = 1;
    xlabel('Time (min)')
    xt = round([0:9.3*2:93.3],0);
    xt(end) = 93.33;
set(gca,'XTick',0:560*2:5600)
set(gca,'XTickLabel',xt)
    ylabel('Attitude Error Error (deg)')
   
 end
 xline(t_eclipse,'-k',{'Eclipse Start'});
    xline(t_eclipse,'-k','LineWidth',1.25);
    xline(t_eclipse_end,'-k',{'Eclipse End'});
    xline(t_eclipse_end,'-k','Linewidth',1.25);
    txt = 'Estimation Period I';
text(t_eclipse/2-800,180/2,txt)
txt2 = 'Estimation Period II';
text((tfinal/2)-800,180/2,txt2) 
txt2 = 'Estimation Period III';
text((t_eclipse+30*60+t_eclipse/2)-700,180/2,txt2) 
h = [p1;p2];
       legend(h,['Attitude\newlineError (deg)'],...
        ['3.5^{\circ} Error\newlineThreshold']); 
%     ylim([0,3.6])
% 
%      title(['Full Orbit Attitude Error Growth, ||\omega|| =',...
%          num2str(norm_omega(1,k)),char(177) num2str(om_plusminus),'% deg/s\newline                           (100 Test Runs)'])

     title(['Full Orbit Attitude Error Growth, ||\omega|| =',...
         num2str(norm_omega(1,k)),' deg/s\newline                           (',num2str(num_omega),' Test Runs)'])
%    title(['Full Orbit Attitude Error Growth, ||\omega|| ramps up from ',...
%          num2str(norm_omega(1,k)),' deg/s to 15.5 deg/s\newline                             within the first 200 seconds of Orbit'])
     
     
%      tout = simOut.tout;
figure;
for j = 1:4
grid on;
subplot(2,2,j)
hold on
plot(t,simOut.q_true.Data(:,j),'k','Linewidth',1.25)
plot(t,simOut.my_qest.Data(:,j),'m--','Linewidth',1.25)
legend('q1 true', 'q1 est')
grid on;
hold off
end
title(['                            Quaternion Estimates, constant \omega =',mat2str(norm_omega(:,w)), 'rad/s'])

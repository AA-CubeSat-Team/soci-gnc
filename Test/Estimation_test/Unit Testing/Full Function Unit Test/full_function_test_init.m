
close all
% clear all
% clc

%make sure all time steps are equal across all files
fswParams.sample_time_s = 0.1;
simParams.sensors.sample_time_s = fswParams.sample_time_s;
estimation.dt = fswParams.sample_time_s;

dt = estimation.dt;

%set initial angular velo
simParams.initialConditions.w0 = [0;0.06;0.0];
fswParams.estimation.ic.w_init = simParams.initialConditions.w0;

% Set initial quaternion value from simParams (change scalar first to
% scalar last in quaternion)
simParams.initialConditions.q0 = [0.533215448243828;0.592817248117098;0.0831095662269988;0.597780725760345];
fswParams.estimation.ic.quat_est_init = [simParams.initialConditions.q0(2);
    simParams.initialConditions.q0(3);
    simParams.initialConditions.q0(4);
    simParams.initialConditions.q0(1)];
set_param(bdroot,'ShowPortDataTypes','on')
set_param(bdroot,'ShowLineDimensions','on')



%%%%% THIS SCRIPT SETS UP PARAMETERS AND INITIAL CONDITIONS FOR the simulink estimator
                                              
estimation = struct;

%%%% Initial Conditions %%%%%
   
estimation.ic.Beta_init = 0.0*[1;1;1];%Initialize gyro Bias
% estimation.ic.quat_est_init = [1;0;0;0]; 

simParams.initialConditions.w0 = [-0.2;0.1;0];

simParams.initialConditions.q0 = [0.53321544;0.592817248; 0.083109566 ;0.597780726];
estimation.ic.quat_est_init = [0.53321544;0.592817248; 0.083109566 ;0.597780726];
estimation.ic.w_init = simParams.initialConditions.w0;
               P_0_a = 3.0462e-6;  % attitude
P_0_b = 9.4018e-13; % bias
estimation.ic.P_init = blkdiag(P_0_a*eye(3),P_0_b*eye(3));
%         zeros(3,3),(0.2*pi/180/3600)*eye(3)];
%         estimation.P_sq = chol(P,'lower'); %create square root form of cov matrix
% estimation.ic.P_sq_init = estimation.P_sq; %initial value of cov matrix for simulink


% Process and measurement covariances
sig_v   = sqrt(10)*1e-7;            % angle random walk
sig_u   = sqrt(10)*1e-10;           % rate random walk
sun_sensor_var = 0.05; %0.05/(sqrt(3)*3.0); % sun sensor measurement covariance
mag_var =  [2e-7;2e-7;2e-7];%(10^-6*[0.403053;0.240996;0.173209]); % magnetometer covariance


%%Time step that the MEKF is ran at
estimation.dt = 0.1; 
estimation.del_t = 0.1; 

%Constant MAtrices
estimation.Q_k = [(sig_v^2*estimation.dt + 1/3*sig_u^2*estimation.dt^3)*eye(3), (0.5*sig_u^2*estimation.dt^2)*eye(3);
        (0.5*sig_u^2*estimation.dt^2)*eye(3), (sig_u^2*estimation.dt)*eye(3)]; %create dynamic nnoise measurement matrix
estimation.gamma = [-eye(3),zeros(3,3);zeros(3,3),eye(3)];
% estimation.Q_sq = chol((estimation.gamma*estimation.Q_k*estimation.gamma'),'lower'); %square root dynamic noise matrix
estimation.Qg = estimation.gamma*estimation.Q_k*estimation.gamma';
   estimation.R = [sun_sensor_var^2*eye(3),zeros(3,3);zeros(3,3),(norm(mag_var)).*eye(3)]; %create measurment error cov matrix
% estimation.R_sq = chol(R,'lower');  % reate square root form of measurement cov matrix  


fswParams.estimation = estimation;
clear estimation
clear sig_v sig_u sun_sensor_var mag_var zero R Beta P




dt = 1/10;
tspan = [0:dt:500]; % time span (5600 seconds is one orbit duration)
m = length(tspan);
t = tspan; % time horizon
tfinal = tspan(m); %final time

simout1=sim('simz','StopTime','tfinal', ...
    'SaveTime','on','TimeSaveName','timeoutNew',...
    'SaveOutput','on','OutputSaveName','youtNew');

        time2=simout1.get('timeoutNew');
        y=simout1.get('youtNew');
        qest_simu = simout1.q_est_simulink.Data'; %get out estimated quaternions from simulink
        % the simulink estimated quaternion
        q_true = simout1.qtrue.Data';
        
        sigma_simu = simout1.three_sig.Data';%get out 3 sigma bounds from simulink (already multiplied by 3 and converted to degrees)
        Validity_Bool = simout1.bool.Data';
%         att = y{7}.Values.Data';
%         figure 
%         plot(t,att(1,:),t,att(2,:),t,att(3,:))
%%%%%%%% CALCULATE THE ERROR QUATERNION FROM SIMULINK Q_EST %%%%%%%%%
for i = 1:m
    q_est_error = ([qest_simu(1,i);qest_simu(2,i);qest_simu(3,i);qest_simu(4,i)]');
        q_true_error = ([q_true(1,i);q_true(2,i);q_true(3,i);q_true(4,i)]');
        qm(i,:) = quat_err(q_est_error,q_true_error);
        qerrs = qm(:,1:4)*2;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% CREATE FIGURE 1: ESTIMATED VS TRUE QUATERNION %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
    subplot(2,2,1)
        plot(t,q_true(1,:),'k*',t,qest_simu(1,:),'g')
        title('q1 Evolution/Estimates')
        xlabel('Time (s)')
        ylabel('q1 (rad)')
        grid on
        legend('True q_1','Estimated q_1 (simulink)','Estimated q_1 (script)','Location','southeast')

        subplot(2,2,2)
            plot(t,q_true(2,:),'k*',t,qest_simu(2,:),'g')
            title('q2 Evolution/Estimates')
            xlabel('Time (s)')
            ylabel('q2 (rad)')
            grid on
            legend('True q_2','Estimated q_2 (simulink)','Estimated q_2 (script)','Location','southwest')

            subplot(2,2,3)
                plot(t,q_true(3,:),'k*',t,qest_simu(3,:),'g')
                title('q3 Evolution/Estimates')
                xlabel('Time (s)')
                ylabel('q3 (rad)')
                grid on
                legend('True q_3','Estimated q_3 (simulink)','Estimated q_3 (script)','Location','northeast')

                subplot(2,2,4)
                    plot(t,q_true(4,:),'k*',t,qest_simu(4,:),'g')
                    title('q4 Evolution/Estimates')
                    xlabel('Time (s)')
                    ylabel('q4 (rad)')
                    grid on
                    legend('True q_4','Estimated q_4 (simulink)','Estimated q_4 (script)','Location','northwest')
                    
%%%%%%%% QUATERNION ERROR PLOTS %%%%%%%%%%%%%%%%
figure
 subplot(2,2,1)
            hold all;
            plot(t,sigma_simu(1,:),'*c')
            plot(t,-sigma_simu(1,:),'*m')
%             plot(t,3*180/pi*vestt(1,:),':m','LineWidth',2);
            plot(t,qerrs(1:end,1)*180/pi,'b'); %%% Simulink Error
%             plot(t,-3*180/pi*vestt(1,:),':c','LineWidth',2);
            title('q_1 Error & 3\sigma Bounds')
            legend('+3\sigma bound (simulink)','-3\sigma bound (simulink)','+3\sigma bound','Script q_1 Error','Simu q_1 Error',...
                '-3\sigma bound','Orientation','horizontal','Location','southeast')
            xlabel('Time (s)')
            ylabel('3 \sigma bound Error (deg)')
            grid on

                subplot(2,2,2)
                    hold all;
                    plot(t,sigma_simu(2,:),'*c')
                    plot(t,-sigma_simu(2,:),'*m')
%                     plot(t,3*180/pi*vestt(2,:),':m','LineWidth',2);
                    plot(t,qerrs(1:end,2)*180/pi,'b'); %%% Simulink Error
%                     plot(t,-3*180/pi*vestt(2,:),':c','LineWidth',2);
                    title('q_2 Error & 3\sigma Bounds')
                    legend('+3\sigma bound (simulink)','-3\sigma bound (simulink)','+3\sigma bound','Script q_2 Error','Simu q_2 Error',...
                        '-3\sigma bound','Orientation','horizontal','Location','southeast')
                    xlabel('Time (s)')
                    ylabel('3 \sigma bound Error (deg)')
                    grid on
                
                        subplot(2,2,3)
                            hold all;
                            plot(t,sigma_simu(3,:),'*c')
                            plot(t,-sigma_simu(3,:),'*m')
%                             plot(t,3*180/pi*vestt(3,:),':m','LineWidth',2);
                            plot(t,qerrs(1:end,3)*180/pi,'b'); %%% Simulink Error
%                             plot(t,-3*180/pi*vestt(3,:),':c','LineWidth',2);
                            title('q_3 Error &3\sigma Bounds')
                            legend('+3\sigma bound (simulink)','-3\sigma bound (simulink)','+3\sigma bound','Script q_3 Error','Simu q_3 Error',...
                                '-3\sigma bound','Orientation','horizontal','Location','southeast')
                            xlabel('Time (s)')
                            ylabel('3 \sigma bound Error (deg)')
                            grid on
                            
                                subplot(2,2,4)
                                    hold all;
%                                     plot(t,sigma_simu(3,:),'*c')
%                                     plot(t,-sigma_simu(3,:),'*m')
        %                             plot(t,3*180/pi*vestt(3,:),':m','LineWidth',2);
                                    plot(t,(q_true(4,:)-qest_simu(4,:))*180/pi,'b'); %%% Simulink Error
        %                             plot(t,-3*180/pi*vestt(3,:),':c','LineWidth',2);
                                    title('q_4 Error')
%                                     legend('+3\sigma bound (simulink)','-3\sigma bound (simulink)','+3\sigma bound','Script q_3 Error','Simu q_3 Error',...
%                                         '-3\sigma bound','Orientation','horizontal','Location','southeast')
                                    xlabel('Time (s)')
                                    ylabel('Error (deg)')
                                    grid on
                                    
sun_bool = Validity_Bool(1,:);                           
lev = 0.2;
% Find points above the level
aboveLine = (sun_bool>=lev);
% Create 2 copies of y
bottomLine = sun_bool;
topLine = sun_bool;
% Set the values you don't want to get drawn to nan
bottomLine(aboveLine) = NaN;
topLine(~aboveLine) = NaN; 

% 
% names1 = {'Healthy'};
% names2 = {'Unhealthy'};
%  y_label1 = {1,length(t)};
%  y_label2 = {1,length(t)};
% for rr = 1:length(t)
%     y_label1{rr} = names1;
%     y_label2{rr} = names2;
% end
% % set(gca,'xtick',[1:2],'yticklabel',names)

figure
    subplot(3,1,1)
    hold on
        plot(t,bottomLine,'r*','MarkerSize',5)
%         set(gca,'ytick',topLine,'YTicklabel',y_label1)
        plot(t,topLine,'g','LineWidth',5)
%         set(gca,'ytick',bottomLine,'YTicklabel',y_label2)
        title('Sun Sensor Health (Green = Healthy Measurements)')
        xlabel('Time (s)')
%         ylabel('True/False')
        grid on
%         xlim([-1,tfinal])
        ylim([-0.1,1.1])
        hold off
%         legend('True q_1','Estimated q_1 (simulink)','Estimated q_1 (script)','Location','southeast')
     
mag_bool = Validity_Bool(2,:);                           
lev = 0.2;
% Find points above the level
aboveLine = (mag_bool>=lev);
% Create 2 copies of y
bottomLine = mag_bool;
topLine = mag_bool;
% Set the values you don't want to get drawn to nan
bottomLine(aboveLine) = NaN;
topLine(~aboveLine) = NaN; 

        subplot(3,1,2)
        hold on
            plot(t,bottomLine,'r*','MarkerSize',5)
        plot(t,topLine,'g','LineWidth',5)
            title('Mag Sensor Health (Green = Healthy Measurements')
            xlabel('Time (s)')
%             ylabel('True/False')
            grid on
%             xlim([-1,tfinal])
            ylim([-0.1,1.1])
                hold off
                
 gyro_bool = Validity_Bool(3,:);                           
lev = 0.2;
% Find points above the level
aboveLine = (gyro_bool>=lev);
% Create 2 copies of y
bottomLine = gyro_bool;
topLine = gyro_bool;
% Set the values you don't want to get drawn to nan
bottomLine(aboveLine) = NaN;
topLine(~aboveLine) = NaN;
               
            subplot(3,1,3)
            hold on
            plot(t,bottomLine,'r*','MarkerSize',5)
            plot(t,topLine,'g','LineWidth',5)
            title('Gyro Sensor Health (Green = Healthy Measurements')
            xlabel('Time (s)')
%             ylabel('True/False')
            grid on
%             xlim([-1,tfinal])
            ylim([-0.1,1.1])
               hold off
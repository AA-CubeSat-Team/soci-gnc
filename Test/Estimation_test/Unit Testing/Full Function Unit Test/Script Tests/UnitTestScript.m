
clc
close all
clearvars -except fswParams simParams TLE
%tag
fswParams.sample_time_s = 1/30; %set all sample times the same
dt = fswParams.sample_time_s;
simParams.sensors.sample_time_s = dt;
simParams.sample_time_s = dt;
simParams.sensors.gyro.sample_time_s = dt;
simParams.sensors.mag.sample_time_s = dt; 
simParams.sensors.sun_sensor.sample_time_s = dt;
simParams.actuators.sample_time_s = dt;
simParams.magField.sample_time_s = dt;
fswParams.actuators.sample_time_s = dt;
dt = fswParams.sample_time_s;
tspan = [0:dt:500];
tfinal = tspan(end);

J = [3,-2,-1;-2,3,-1;-1,-1,4]; %inertial matrix
q0 = [0;0;0;1];
w0 = [0.1;0;0];
p0 = [q0;w0]; % initial conditions q0 concatinated with w0 !!THIS IS SCALAR LAST!!
K = @(t,x) [(0.5.*([x(4), -x(3), x(2); x(3), x(4), -x(1); -x(2), x(1), x(4); -x(1), -x(2), -x(3)]*[x(5); x(6); x(7)]));
    (inv(J)*[0.025.*sin(0.2.*t);0;0] - inv(J)*[0, -x(7), x(6); x(7), 0 , -x(5); -x(6), x(5), 0]*J*[x(5); x(6); x(7)])];
% 0.025.*sin(0.2.*t); this can be used as a torgue input
opts = odeset('RelTol',1e-8,'AbsTol',1e-8);
[t,x1] = ode45(K, tspan, p0,opts); %solve the kinematic ode for quaternion and omega


Rb = zeros(6,length(tspan));
  Ri = [0.1;1;0.025]; %sun inertial vec
        Bb = [14491; 3674; 39514] *1e-9; %mag inertial vec
        
sun_sensor_var = 8e-3;
mag_var = 2e-7;
w = length(tspan);

tout = t;
q = x1(:,1:4); %%% here is the true quaternion
wtrue = x1(:,5:7); %%%here is the true omega
    for ii = 1:w
        qq1 = q(ii,1); %I know this part is badly written code, ignore for now
        qq2 = q(ii,2);
        qq3 = q(ii,3);
        qq4 = q(ii,4);
        q_true(:,ii) = q(ii,1:4)';
    
           norm_qtrue(:,ii) = norm(q_true(:,ii),2);
           q_true(:,ii) = q_true(:,ii)./norm_qtrue(:,ii); %force normalization of true quat
           norm_q(:,ii) = norm(q_true(:,ii),2);
        
          qmix(:,ii) = [q_true(4,ii);q_true(1,ii);q_true(2,ii);q_true(3,ii)];
        
        CIB = quat2dcm([qq4,qq1,qq2,qq3]); %directional cosine matrix
        eps = (sun_sensor_var)*randn(3,w);%Gausian noise sun
        epsb = (mag_var)*randn(3,w); %Gaussian noise mag
        
      
        Rb(:,ii) = [(CIB*Ri) + eps(:,1);(CIB*Bb) + epsb(:,1)]; %noisy meas. values 6x1
        Rb_hat(:,ii) = [(CIB*Ri);(CIB*Bb)]; %true meas. values
    end

sun_meas = [tspan',Rb(1:3,:)']; %measurement vectors as inputs to library in model
mag_meas = [tspan',Rb(4:6,:)'];
qtrue1 = [tspan', qmix']; %true quaternion for error calc in model

%%%Gyro measurement creation
sigv = sqrt(10)*1e-7;% gyro sensor noise
sigu = sqrt(6)*1e-10;
num_g=dt*[1 1];den_g=2*[1 -1];
[phi_g,gam_g,c_g,d_g]=tf2ss(num_g,den_g); %create biases and omega measurements
bias1=dlsim(phi_g,gam_g,c_g,d_g,sigu/sqrt(dt)*randn(w,1),0.1*pi/180/3600/dt);
bias2=dlsim(phi_g,gam_g,c_g,d_g,sigu/sqrt(dt)*randn(w,1),0.1*pi/180/3600/dt);
bias3=dlsim(phi_g,gam_g,c_g,d_g,sigu/sqrt(dt)*randn(w,1),0.1*pi/180/3600/dt);
bias=[bias1 bias2 bias3];
omega_tilda=wtrue+sqrt(sigv^2/dt+1/12*sigu^2*dt)*randn(w,3)+bias;
 
omega_meas = [tspan',omega_tilda];%measurement vectors as inputs to library in model
%%
close all
q_init = mat2str(circshift(p0(1:4),1)); %create scalar first quaternion initial condition
set_param( 'UnitTest_2/MEKF_lib/Unit Delay2', 'InitialCondition',q_init) %set quat init
sim('UnitTest_2',tfinal)

%extract values from sim
qtrue = qmix;
qest = my_qest.signals.values;
quat_error = quat_theta_error_deg.signals.values;
om_true = wtrue;
angular_velo_est = omega_est.signals.values;
bias = bias.signals.values;

tout = t;
%%%plot Quaternion error for theta angle
figure
plot(tout, quat_error)
title('Quaternion Error in degrees (theta angle)')
ylabel('Error (deg)')
xlabel('Time (s)')
grid on

%%%plot of quaternions estimates vs true values
figure;
for i = 1:4
grid on;
subplot(2,2,i)
title('Quaternion Estimates')
hold on
plot(tout,qtrue(i,:),'k','Linewidth',1.25)
plot(tout,qest(:,i),'m--','Linewidth',1.25)
legend(['q_',num2str(i),  'true'],[ 'q_',num2str(i),  'est'])
grid on;
xlabel('Time (s)')
ylabel('Quat Value (rad)')
hold off
end


%%%plot angular velocities
g = ['x';'y';'z'];
figure;
for i = 1:3
grid on;
subplot(3,1,i)
title('Angular Velocity Estimates')
hold on
plot(tout,wtrue(:,i),'k','Linewidth',1.25)
plot(tout,angular_velo_est(:,i),'m--','Linewidth',1.25)
legend(['\omega_',g(i),  'true'],[ '\omega_',g(i),  'est'])
grid on;
xlabel('Time (s)')
ylabel('\omega Value (rad/s)')
hold off
end

%%%plot Bias

figure;
for i = 1:3
grid on;
subplot(3,1,i)
title('Estimated Bias')
hold on
plot(tout,bias(:,i),'k','Linewidth',1.25)
legend(['bias_',g(i)])
grid on;
xlabel('Time (s)')
ylabel('bias Value ')
hold off
end

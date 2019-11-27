clear all
close all
% clc
%%%%Create the q and omega vectors simulated data

tspan = [0:0.01:20];
% for qqq = 1:1
% J = [3,-2,-1;-2,3,-1;-1,-1,4];
% p0 = [0;0;0;1;0.00;0.005;0]; % initial conditions q0 concatinated with w0
% K = @(t,x) [(0.5.*([x(4), -x(3), x(2); x(3), x(4), -x(1); -x(2), x(1), x(4); -x(1), -x(2), -x(3)]*[x(5); x(6); x(7)]));
%     (inv(J)*[0.0025.*sin(1.5.*t);0;0] - inv(J)*[0, -x(7), x(6); x(7), 0 , -x(5); -x(6), x(5), 0]*J*[x(5); x(6); x(7)])];
% 
% K = @(t,x) [(0.5.*([x(4), -x(3), x(2); x(3), x(4), -x(1); -x(2), x(1), x(4); -x(1), -x(2), -x(3)]*[x(5); x(6); x(7)]));
%     (inv(J)*[0;0;0] - inv(J)*[0, -x(7), x(6); x(7), 0 , -x(5); -x(6), x(5), 0]*J*[x(5); x(6); x(7)])];

% tic
% [t,x1] = ode45(K, tspan, p0);
% toc
Mag = [];
% Mag = sqrt((x1(:,1)).^2 + (x1(:,2)).^2 + (x1(:,3)).^2 + (x1(:,4)).^2);
w = length(tspan);
Rb = zeros(6,length(tspan));
sig_v = sqrt(10)*1e-9;% gyro sensor noise
sig_u = sqrt(6)*1e-9;
sun_sensor_var = 0.004;% (0.5*pi)/(3*180)*10^-3;
mag_var =  0.004; %10^-3*[0.403053;0.240996;0.173209];
dt = tspan(2)-tspan(1);
w = length(tspan);
M = 1; %number of monte carlo iterations
error = zeros(M,w);
m = length(tspan);

w=[zeros(m,1) -inv(91.5/(2*pi)*60)*ones(m,1) zeros(m,1)];
q0=[cos(pi/2)*sin(-pi/4);sin(pi/2)*sin(pi/4);sin(pi/2)*cos(-pi/4);cos(pi/2)*cos(-pi/4)];
q=zeros(m,4);q(1,:)=q0(:)';
dt1 = 40;

% Quaternion Over Time
for i=1:m-1,
 wnorm=norm(w(i,:));
 co=cos(0.5*wnorm*dt1);
 si=sin(0.5*wnorm*dt1);
 n1=w(i,1)/wnorm;n2=w(i,2)/wnorm;n3=w(i,3)/wnorm;
 qw1=n1*si;qw2=n2*si;qw3=n3*si;qw4=co;
 om=[qw4  qw3 -qw2 qw1;-qw3  qw4  qw1 qw2;qw2 -qw1  qw4 qw3;-qw1 -qw2 -qw3 qw4];
 q(i+1,1:4)=(om*q(i,1:4)')';
end
q = [q(:,2),q(:,3),q(:,4),q(:,1)];
% tic
% for j = 1:M
    % for loop below creates matrix CIB for each q vector at each time interval
    %generate quaternions and data, both noisy and true
    tic
    for ii = 1:length(tspan)
        qq1 = q(ii,1);
        qq2 = q(ii,2);
        qq3 = q(ii,3);
        qq4 = q(ii,4);
        q_true(:,ii) = q(ii,1:4)';
        CIB = [(1-2.*(qq2.^2 + qq3.^2)) ,(2.*qq1.*qq2 + 2.*qq3.*qq4), (2.*qq1.*qq3 - 2.*qq2.*qq4);
            (2.*qq1.*qq2 - 2.*qq3.*qq4) ,(1 - 2.*(qq1.^2 + qq3.^2)), 2.*qq2.*qq3 + 2.*qq1.*qq4;
            (2.*qq1.*qq3 + 2.*qq2.*qq4) ,(2.*qq2.*qq3 -2.*qq1.*qq4), (1-2.*(qq1.^2 + qq2.^2))];
        
        
        eps = (sun_sensor_var)*randn(3,m);%Gausian noise
        epsb = (sun_sensor_var)*randn(3,m);
        Ri = [0.7;0.9;0.1];
        Ri = Ri./norm(Ri);
        Bb = [0.7;0.1;1];
        Bb = Bb./norm(Bb);
        Rb(:,ii) = [(CIB*Ri) + eps(:,1);(CIB*Bb) + epsb(:,1)]; %noisy values
        Rb_hat(:,ii) = [(CIB*Ri);(CIB*Bb)]; %true values
        noise = (sig_v)*randn(3,m);
        vk(:,ii) = noise(:,1);
         
        qt(ii,:) = ([q_true(4,ii);q_true(1,ii);q_true(2,ii);q_true(3,ii)]');
%         ii = ii+1;
%     Qx = [0 -qe(3) qe(2);qe(3) 0 -qe(1);-qe(2) qe(1) 0]
    end
    
%   meas = starmeas(qt,FOV,MTH,sigma);
   
%    meas=starmeas(qt,6,2,sun_sensor_var);

% b=meas(:,1:n);
% bm=meas(:,31:2*n);
% im=meas(:,61:3*n);
% av=meas(:,91:100);
    
    
    
    
%     Ang = acosd(Rb);
%     omega_tilda1 = x1(:,5:7); %measured true
    
    wtrue=[zeros(m,1) -inv(91.5/(2*pi)*60)*ones(m,1) zeros(m,1)];
sigu=sig_u;
sigv=sig_v;
num_g=dt*[1 1];den_g=2*[1 -1];
[phi_g,gam_g,c_g,d_g]=tf2ss(num_g,den_g);
bias1=dlsim(phi_g,gam_g,c_g,d_g,sigu/sqrt(dt)*randn(m,1),0.1*pi/180/3600/dt);
bias2=dlsim(phi_g,gam_g,c_g,d_g,sigu/sqrt(dt)*randn(m,1),0.1*pi/180/3600/dt);
bias3=dlsim(phi_g,gam_g,c_g,d_g,sigu/sqrt(dt)*randn(m,1),0.1*pi/180/3600/dt);
bias=[bias1 bias2 bias3];
omega_tilda=wtrue+sqrt(sigv^2/dt+1/12*sigu^2*dt)*randn(m,3)+bias;
% omega_tilda(400:1750,2) = omega_tilda(400:1750,2)*2;
    valid = [tspan',ones(m,1)];
valid(100:600,2) = 0;
%          valid(400:1750,2) = 0;
%  for j = 1:M        
    %%%initialize stuff
for j = 1:1
    %%% EKF initialize values %%%
    eyez = sparse(eye(3)); %sparse 3x3 identity matrix
    zero = zeros(3,3);
    del_t = tspan(2)-tspan(1); %t(2)-t(1);
    R = [sun_sensor_var^2*eye(3),zero;zero,(mag_var.^2).*eye(3)];
    Beta = 0.0*[1;1;1]; %Initialize gyro Bias
    Beta_init = Beta;
%     del_x = 0; %initializing delta x_k minus
%     r_ix = [0 -Ri(3) Ri(2);Ri(3) 0 -Ri(1);-Ri(2) Ri(1) 0]; %the direction to
    %the Sun is given by the following unit vector in the inertial-frame:
    Q_k = [(sig_v^2*del_t + 1/3*sig_u^2*del_t^3)*eye(3), (0.5*sig_u^2*del_t^2)*eye(3);
        (0.5*sig_u^2*del_t^2)*eye(3), (sig_u^2*del_t)*eye(3)];
    gamma = [-eye(3),zeros(3,3);zeros(3,3),eye(3)];
    q1 = 0.707; %initilize the quaternion value [0;0;0;1;0.05;0;0];
    q2 = 0.707;
    q3 = 0;
    q4 = 0;
    qe = [q1;q2;q3;q4];
    qe = q(1,:)';
    qe_init = qe;
    scalar = 0.0001;
    P = [(0.1*pi/180)^2*eye(3) zero;
    zero,(0.2*pi/180/3600)*eye(3)];%initialize covariance matrix
%     Pinv = inv(P);
    P_sq = chol(P,'lower');
    P_sq_init = P_sq;
    R_sq = chol(R,'lower');
    [np,mp] = size(P);
    [nr,mr] = size(R_sq);
     Q_sq = chol((gamma*Q_k*gamma'),'lower');
     Rb1 = [tspan',Rb(1:3,:)'];
     Rb2 = [tspan',Rb(4:6,:)'];
%      Rb3 = Rb(3,:);
     
     om1 = [tspan',omega_tilda];
     om2 = omega_tilda(:,2);
     om3 = omega_tilda(:,3);%signal for omega in simulink
%      gain1 = Simulink.Parameter(2.52);
     
%     Rinv = inv(R);
%     Vc = chol(Rinv,'lower');
%     
%     [Z,E] = eig(full(Q_k));
end
% Z*E*Z'-Q_k;

%
%%% Squaqre root Form P matrix
    %%%EKF routine
   
%     Q_sq = chol(Q_k);
%     tic
    
    for i = 1:m
        Q = [qe(1:3,1)]; %change these q's to be q(1,1)
        Qx = [0 -qe(3) qe(2);qe(3) 0 -qe(1);-qe(2) qe(1) 0]; %cross product matrix of q
        Xi_q = [qe(4)*eye(3)+Qx;-Q'];
        Phi_q = [qe(4)*eye(3)-Qx;-Q'];
        A_q = Xi_q'*Phi_q;   %A(q_k minus) matrix
        
        mat = A_q*Ri;
        mat_x = [0 -mat(3) mat(2);mat(3) 0 -mat(1);-mat(2) mat(1) 0]; %cross product matrix of q
        
         mat1 = A_q*Bb;
        mat_x1 = [0 -mat1(3) mat1(2);mat1(3) 0 -mat1(1);-mat1(2) mat1(1) 0];
        %%%Gain
        H = [mat_x, zero;mat_x1,zero]; %sensitivity matrix
        
%         P_sq = chol(P,'lower');
        A = [R_sq',zeros(nr,np);(P_sq')*H', P_sq'];
        [TA,UA] = qr(A);
        P_sq = UA(7:12,7:12)'; %Updated P_sq
        W = UA(1:6,7:12)';
        sq_Bk = UA(1:6,1:6)';
        K = W*inv(sq_Bk);
%         K = (P*H')*inv(H*P*H' + R);
        
        
        %%%Update
        full_P  = P_sq*P_sq';
        vestt(:,i) = diag(full_P).^(0.5);
%        

%         rb = Rb(:,i);
        del_x = K*(Rb(:,i)-[A_q*Ri;A_q*Bb]);
      state_err(:,i) = del_x;
        
        % q = [q1;q2;q3;q4];
        del_alpha = del_x(1:3,1);
        del_beta = del_x(4:6,1);
        
        qe = qe + 0.5*Xi_q*del_alpha;
        
        qe = 1/(norm(qe))*qe; %renormalize
        qest(:,i) = qe;
        qmix1 = ([qest(4,i);qest(1,i);qest(2,i);qest(3,i)]');
        qmix = ([qest(4,i);-qest(1,i);-qest(2,i);-qest(3,i)]');
        qmix_true = ([q_true(4,i);q_true(1,i);q_true(2,i);q_true(3,i)]');
        qm(i,:) =  quatmultiply(qmix,qmix_true);
% qm(i,:) = quat_err(qmix,qmix_true);
qerr = qm(:,2:4);

% qmix = ([qest(4,i);-qest(1,i);-qest(2,i);-qest(3,i)]');
        ytil(:,i) = quatrotate(qmix1,Ri');
%         ytil(:,i) = A_q*Ri;
        ytile(:,i) = mat_x*del_alpha;

         %store the quaternion
%         constraint = qe'*qe; %should equal 1 or very close, normalize
        Beta = Beta + del_beta;
        beta_est(:,i) = Beta;
        
        
        %%%Propagation%%%
        omega_meas = omega_tilda(i,:);
        omega = omega_tilda(i,:)' - Beta;
        omega_est(:,i) = omega;
        om_mag = norm(omega); %norm of omega estimate
        sin_omega = sin(0.5*om_mag*del_t);
        
        Psi = (sin_omega*omega)/om_mag;
        Psi_x = [0 -Psi(3) Psi(2);Psi(3) 0 -Psi(1);-Psi(2) Psi(1) 0];
        
        Omega_omega = [(cos(0.5*om_mag*del_t)*eyez - Psi_x), Psi; -Psi', cos(0.5*om_mag*del_t)];
        cos_omega = (1-cos(om_mag*del_t))/om_mag^2;
        
        omega_x = [0 -omega(3) omega(2);omega(3) 0 -omega(1);-omega(2) omega(1) 0];
        Phi_discrete = [(eyez-omega_x*sin(om_mag*del_t)/om_mag + (omega_x^2)*cos_omega),omega_x*cos_omega-eyez*del_t-omega_x^2*(om_mag*del_t-sin(om_mag*del_t))/om_mag^3;
            zero,eyez;];
        
          qe = Omega_omega*qe; %quaternion propagation
          
          
%         P_sq_plus = chol(P,'lower');
       
          C = [P_sq'*Phi_discrete';Q_sq'];
          [Tc,Uc] = qr(C);
%           Uc = full(Uc);
          sq_P_kp1 = Uc(1:6,1:6)';
%           P = sq_P_kp1'*sq_P_kp1;
          P_sq = sq_P_kp1;
          
%         P = Phi_discrete*P*Phi_discrete' + gamma*Q_k*gamma';
        %covariance Propagation
%         error_norm(:,i) = norm((ytil(:,i)-Rb_hat(:,i)),2); %tracking estimate error
%         error_norm_noise(:,i) = norm((Rb(:,i)-Rb_hat(:,i)),2);
%         
    end
    
% figure
% plot(tspan/60,wtrue(:,2),tspan/60,omega_est(2,:))
% legend('true angu','script angu')
% figure
% plot(tspan/60,beta_est(1,:))
% legend('script beta')

%     toc
%     error(j,:) = error_norm;
%     error_noise(j,:) = error_norm_noise;
    
    
%  end
toc

% toc
% tic
% % [u,d] = udu(P);
% k = 1;
% % toc
% Monte_norm = mean(error,1);
% % erromonte = mean(error_noise,1);
% % semilogx(Monte_norm)
% figure
% hold on
% semilogy(t/60,Monte_norm*180/pi);
% % semilogy(t/60,erromonte*180/pi);
% grid on
% xlabel('Time (min)')
% ylabel('Error Norm')
% set(gca, 'XScale', 'linear')

% qerr=quat_err(qest',x1(:,1:4));erre=asin(qest(1:3,:))*2*180/pi;
t = tspan;
tfinal = tspan(m);

% Simulation with digital controller
tic
simout1=sim('lib_testValidity','StopTime','tfinal', ...
    'SaveTime','on','TimeSaveName','timeoutNew',...
    'SaveOutput','on','OutputSaveName','youtNew');
toc
time2=simout1.get('timeoutNew');
y=simout1.get('youtNew');
qest_simu=y{2}.Values.Data';
% ww=y{3}.Values.Data';
sigma_simu=y{4}.Values.Data';



for i = 1:m
    qmix1s = ([qest_simu(4,i);qest_simu(1,i);qest_simu(2,i);qest_simu(3,i)]');
        qmixs = ([qest_simu(4,i);-qest_simu(1,i);-qest_simu(2,i);-qest_simu(3,i)]');
        qmix_true = ([q_true(4,i);q_true(1,i);q_true(2,i);q_true(3,i)]');
        qms(i,:) =  quatmultiply(qmixs,qmix_true);
% qm(i,:) = quat_err(qmix,qmix_true);
qerrs = qms(:,2:4); 
    
end
figure
subplot(2,2,1)
% hold on
plot(t,q(:,1),'k*',t,qest_simu(1,:),'g')
title('q1 Evolution/Estimates')
xlabel('Time (min)')
ylabel('q1 (rad)')
grid on
legend('True q1','Estimated q1 (simulink)','Location','northeast')

subplot(2,2,2)
% hold on
plot(t,q(:,2),'k*',t,qest_simu(2,:),'g')
title('q2 Evolution/Estimates')
xlabel('Time (min)')
ylabel('q2 (rad)')
grid on
legend('True q2','Estimated q2 (simulink)','Location','southwest')

subplot(2,2,3)
% hold on
plot(t,q(:,3),'k*',t,qest_simu(3,:),'g')
title('q3 Evolution/Estimates')
xlabel('Time (min)')
ylabel('q3 (rad)')
grid on
legend('True q3','Estimated q3 (simulink)','Location','north')

subplot(2,2,4)
% hold on
plot(t,q(:,4),'k*',t,qest_simu(4,:),'g')
title('q4 Evolution/Estimates')
xlabel('Time (min)')
ylabel('q4 (rad)')
grid on
legend('True q4','Estimated q4 (simulink)','Location','north')
% 
% figure
% plot(tspan/60,beta_est(1,:))
% legend('true angu','script angu')
% 

figure
subplot(2,1,1)
hold on
% plot(t,x1(:,3),'k*',t,qest(3,:)) %t,x1(:,2),'r',t, x1(:,3),'g',t,x1(:,4),t,Mag)
% plot(t,x1(:,7),'b*',t,omega_est(3,:)) %angular velo
plot(t/60,Rb(1,:)*180/pi,'--m','MarkerSize',3)
plot(t/60,ytil(1,:)*180/pi,'g',t/60,Rb_hat(1,:)*180/pi,'--k')%,t,omega_est(1,:),t,omega_tilda(:,1),t,x1(:,5))
% plot(t,omega_est(1,:),t,omega_tilda(:,1),t,x1(:,5))%attitude z angle in body frame
title('Roll Angle Time Evolution/Estimates')
xlabel('Time (min)')
ylabel('Roll Angle (deg)')
grid on
% title('Components of q and its Magnitude')
legend('Noisy Roll Data', 'Estimated Roll', 'True Roll')


        k1 = ytil(1,:)-Rb_hat(1,:);
        error1 = Rb(1,:)-Rb_hat(1,:);
            subplot(2,1,2)
            hold all;
            plot(t/60,sigma_simu(1,:),'*c')
            plot(t/60,-sigma_simu(1,:),'*m')
            plot(t/60,3*180/pi*vestt(1,:),':m','LineWidth',2);
%             plot(t/60,qerr(1:end,1)'*180/pi,'k*');
             plot(t/60,qerrs(1:end,1)'*180/pi,'b');
        %     plot(t/60,error1*180/pi);
            plot(t/60,-3*180/pi*vestt(1,:),':c','LineWidth',2);
        %     xlim([0,t(w)])
         title('Roll Error 3\sigma Bounds')
        legend('+3\sigma bound (simulink)','-3\sigma bound (simulink)','+3\sigma bound','Pitch Error','-3\sigma bound','Orientation','horizontal')
            xlabel('Time (min')
            ylabel('3 \sigma bound Error (deg)')
         grid on
 
 figure
subplot(2,1,1)
hold on
% plot(t,x1(:,3),'k*',t,qest(3,:)) %t,x1(:,2),'r',t, x1(:,3),'g',t,x1(:,4),t,Mag)
% plot(t,x1(:,7),'b*',t,omega_est(3,:)) %angular velo
plot(t/60,Rb(2,:)*180/pi,'--r','MarkerSize',3)
plot(t/60,ytil(2,:)*180/pi,'g',t/60,Rb_hat(2,:)*180/pi,'--k')%,t,omega_est(1,:),t,omega_tilda(:,1),t,x1(:,5))
% plot(t,omega_est(1,:),t,omega_tilda(:,1),t,x1(:,5))%attitude z angle in body frame
title('Pitch Angle Time Evolution/Estimates')
xlabel('Time (min)')
ylabel('Pitch Angle (deg)')
grid on
% title('Components of q and its Magnitude')
legend('Noisy Pitch Data', 'Estimated Pitch Angle', 'True Pitch Angle')


        k2 = ytil(2,:)-Rb_hat(2,:);
        error1 = Rb(2,:)-Rb_hat(2,:);
            subplot(2,1,2)
            hold all;
            plot(t/60,sigma_simu(2,:),'*c')
            plot(t/60,-sigma_simu(2,:),'*m')
            plot(t/60,3*180/pi*vestt(2,:),':m','LineWidth',2);
%             plot(t/60,state_err(2,:)*180/pi,'k');
% plot(t/60,qerr(1:end,2)*180/pi,'k');
plot(t/60,qerrs(1:end,2)*180/pi,'k');
        %     plot(t/60,error1*180/pi);
            plot(t/60,-3*180/pi*vestt(2,:),':c','LineWidth',2);
           
        %     xlim([0,t(w)])
         title('Pitch Error 3\sigma Bounds')
          legend('+3\sigma bound','Pitch Error','-3\sigma bound','Orientation','horizontal')
            xlabel('Time (min')
            ylabel('3 \sigma bound Error (deg)')
         grid on

 
 figure
subplot(2,1,1)
% plot(t,x1(:,3),'k*',t,qest(3,:)) %t,x1(:,2),'r',t, x1(:,3),'g',t,x1(:,4),t,Mag)
% plot(t,x1(:,7),'b*',t,omega_est(3,:)) %angular velo
plot(t/60,Rb(3,:)*180/pi,'--m',t/60,ytil(3,:)*180/pi,'g',t/60,Rb_hat(3,:)*180/pi,'--k')%,t,omega_est(1,:),t,omega_tilda(:,1),t,x1(:,5))
% plot(t,omega_est(1,:),t,omega_tilda(:,1),t,x1(:,5))%attitude z angle in body frame
title('Yaw Angle Time Evolution/Estimates')
xlabel('Time (min)')
ylabel('Yaw Angle (deg)')
grid on
legend('Noisy Yaw Data', 'Estimated Yaw Angle', 'True Yaw Angle')

        subplot(2,1,2)
        hold all;
        plot(t/60,sigma_simu(3,:),'*c')
        plot(t/60,-sigma_simu(3,:),'*m')
        plot(t/60,qerrs(1:end,2)*180/pi,'k');
        plot(t/60,3*180/pi*(vestt(3,:)),':m','LineWidth',2);
        plot(t/60,-3*180/pi*(vestt(3,:)),':c','LineWidth',2);
       
        title('Yaw Error 3\sigma Bounds')
    %     xlim([0,t(w)])
    legend('+3\sigma bound (simulink)','-3\sigma bound (simulink)','+3\sigma bound','Pitch Error','-3\sigma bound','Orientation','horizontal')
        xlabel('Time (min')
        ylabel('3 \sigma bound Error')
        grid on
%  
%         figure
%        plot(t/60,180/pi*(Rb_hat(1,:)-Rb(1,:)),t/60,180/pi*k1)

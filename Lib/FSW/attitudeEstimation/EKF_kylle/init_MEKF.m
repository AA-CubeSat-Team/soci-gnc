
estimation = struct; 


estimation.sig_v = sqrt(10)*1e-10;% gyro sensor noise
estimation.sig_u = sqrt(6)*1e-9;
estimation.sun_sensor_var = 0.0004; %sun sensor variance
estimation.mag_var = [0.403053*10^-3;0.240996*10^-3;0.173209*10^-3];
estimation.dt = .1;
% estimation.w = length(tspan);


% M = 1; %number of monte carlo iterations
% error = zeros(M,w);
% m = length(tspan);

eyez = sparse(eye(3)); %sparse 3x3 identity matrix
zero = zeros(3,3);
% dt = tspan(2)-tspan(1); %t(2)-t(1);
estimation.R = [sun_sensor_var^2*eye(3),zero;zero,(mag_var.^2).*eye(3)]; %create measurment error cov matrix
estimation.Beta = 0.0*[1;1;1]; %Initialize gyro Bias
estimation.Beta_init = Beta;
%     
    %the Sun is given by the following unit vector in the inertial-frame:
    Q_k = [(estimation.sig_v^2*estimation.dt + 1/3*estimation.sig_u^2*estimation.dt^3)*eye(3), (0.5*estimation.sig_u^2*estimation.dt^2)*eye(3);
        (0.5*sig_u^2*estimation.dt^2)*eye(3), (sig_u^2*estimation.dt)*eye(3)]; %create dynamic nnoise measurement matrix
    gamma = [-eye(3),zeros(3,3);zeros(3,3),eye(3)];
    q1 = 0; %initilize the quaternion value [0;0;0;1;0.05;0;0];
    q2 = 0;
    q3 = 0;
    q4 = 1.0;
    qe = [q1;q2;q3;q4];
    qe = q(1,:)';
    qe_init = qe; %initial quaternion estimate
    scalar = 0.000001;
    P = [(0.1*pi/180)^2*eye(3) zero;
    zero,(0.2*pi/180/3600)*eye(3)];%initialize covariance matrix
%     Pinv = inv(P);
    P_sq = chol(P,'lower'); %create square root form of cov matrix
    P_sq_init = P_sq; %initial value of cov matrix for simulink
    R_sq = chol(R,'lower');  % reate square root form of measurement cov matrix
    [np,mp] = size(P);
    [nr,mr] = size(R_sq);
     Q_sq = chol((gamma*Q_k*gamma'),'lower'); %square root dynamic noise matrix
     Rb1 = [tspan',Rb'];
     Rb2 = Rb(2,:);
     Rb3 = Rb(3,:);
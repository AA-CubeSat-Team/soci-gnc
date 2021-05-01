clear;
% set default parameters
init_params;

% sample time
% simParams.sample_time_s = (1/200);

% overwrite gyro noise values
simParams.sensors.gyro.arw = 4e-4 * ones(3,1);
simParams.sensors.gyro.rrw = 1e-6 * ones(3,1);

dt = simParams.sample_time_s;
tf = 24 * 3600; 

% sim the model to get data
simout = sim('allen_var_test','StopTime',num2str(tf));
omega  = simout.omega;

%% Run allen variance test
theta_all = cumsum(omega, 1) * dt;
atau = cell(3,1);
adev = cell(3,1);
M = zeros(3,1); dM = zeros(3,1);
N = zeros(3,1); dN = zeros(3,1);
B = zeros(3,1); dB = zeros(3,1);
K = zeros(3,1); dK = zeros(3,1);

for ax = 1:3
    theta = theta_all(:,ax);

    maxNumM = 100;
    L = size(theta, 1);
    maxM = 2.^floor(log2(L/2));
    m = logspace(log10(1), log10(maxM), maxNumM).';
    m = ceil(m); % m must be an integer.
    m = unique(m); % Remove duplicates.
    
    tau = m*dt;
    
    avar = zeros(numel(m), 1);
    for i = 1:numel(m)
        mi = m(i);
        avar(i,:) = sum( ...
            (theta(1+2*mi:L) - 2*theta(1+mi:L-mi) + theta(1:L-2*mi)).^2, 1);
    end
    avar = avar ./ (2*tau.^2 .* (L - 2*m));
    atau{ax}  = tau;
    adev{ax} = sqrt(avar);
    
    M(ax) = adev{ax}(1);
    N(ax) = getARW(tau,adev{ax});
    B(ax) = getBiasInstability(tau,adev{ax});
    K(ax) = getRRW(tau,adev{ax});
    
    % compute relative error
    Mtrue = simParams.sensors.gyro.arw(ax);
    Btrue = simParams.sensors.gyro.rrw(ax);
    dM(ax) = (M(ax) - Mtrue) / Mtrue;
    dB(ax) = (B(ax) - Btrue) / Btrue;

end

fprintf('Relative error in "ARW": \n')
fprintf('\tx: %4.3e | %4.2f%% \n',dM(1), dM(1)*100)
fprintf('\ty: %4.3e | %4.2f%% \n',dM(2), dM(2)*100)
fprintf('\tz: %4.3e | %4.2f%% \n',dM(3), dM(3)*100)
fprintf('Relative error in "RRW": \n')
fprintf('\tx: %4.3e | %4.2f%% \n',dB(1), dB(1)*100)
fprintf('\ty: %4.3e | %4.2f%% \n',dB(2), dB(2)*100)
fprintf('\tz: %4.3e | %4.2f%% \n',dB(3), dB(3)*100)

figure(1), clf, hold on, grid on, box on
for ax = 1:3
    loglog(atau{ax}, adev{ax},'LineWidth',2)
end
set(gca,'FontSize',14,'YScale','log','XScale','log',...
    'YLim',[0.1*Btrue,10*Mtrue])
xlim = get(gca,'XLim');
plot(xlim,[Mtrue, Mtrue],'b--','LineWidth',2)
plot(xlim,[Btrue, Btrue],'r--','LineWidth',2)
legend('x-axis','y-axis','z-axis','My "RRW"','My "RRW"',...
            'FontSize',16,'location','north')
title('Allan Deviation','FontSize',16)
xlabel('\tau','FontSize',18)
ylabel('\sigma(\tau)','FontSize',18)

function B = getBiasInstability(tau,adev)
    slope = 0;
    logtau = log10(tau);
    logadev = log10(adev);
    [~, i] = min(abs(adev));

    % Find the y-intercept of the line.
    b = logadev(i) - slope*logtau(i);

    % Determine the bias instability coefficient from the line.
    scfB = sqrt(2*log(2)/pi);
    logB = b - log10(scfB);
    B = 10^logB;
end

function N = getARW(tau,adev)
    slope = -0.5;
    logtau = log10(tau);
    logadev = log10(adev);
    dlogadev = diff(logadev) ./ diff(logtau);
    [~, i] = min(abs(dlogadev - slope));
    % Find the y-intercept of the line.
    b = logadev(i) - slope*logtau(i);
    
    % Determine the angle random walk coefficient from the line.
    logN = slope*log(1) + b;
    N = 10^logN;
end

function K = getRRW(tau,adev)
    slope = 0.5;
    logtau = log10(tau);
    logadev = log10(adev);
    dlogadev = diff(logadev) ./ diff(logtau);
    [~, i] = min(abs(dlogadev - slope));
    
    % Find the y-intercept of the line.
    b = logadev(i) - slope*logtau(i);
    
    % Determine the rate random walk coefficient from the line.
    logK = slope*log10(3) + b;
    K = 10^logK;
end
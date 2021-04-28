% clear;

simParams = struct;
[~,simParams] = constants_init([],simParams);
% get constants
RPM2RPS = simParams.constants.convert.RPM2RPS;
RPS2RPM = simParams.constants.convert.RPS2RPM;

data_RPM = [ 0; 100; 500; 600; 1000; 2000; 3000; 5000; 6500 ];
data_RPS = RPM2RPS .* data_RPM;
data_P_W = [ 0.04; 0.115; 0.125; 0.125; 0.135; 0.170; 0.215; 0.315; 0.405 ];

% take out zero-level from the data
ls_RPM = data_RPM(2:end);
ls_RPS = data_RPS(2:end);
ls_P_W = data_P_W(2:end) - data_P_W(1);

% form A matrix
N1 = numel(ls_RPS);
N2 = 4; % choose a fourth order polynomial
A  = zeros(N1,N2);
b  = zeros(N1,1);

for k = 1:N1
    for i = 1:N2
        A(k,i) = ls_RPS(k).^(i-1);
    end
    b(k) = ls_P_W(k);
end
% solve for coefficients
c = A\b;
c(1) = c(1) + data_P_W(1); % zero-level adjustment

% construct "low" RPM model
RPS_interp_lo = linspace(data_RPS(1),data_RPS(2));
K0 = data_P_W(1);
K1 = (data_P_W(2) - data_P_W(1)) / (data_RPS(2) - data_RPS(1));
P_W_interp_lo = K0 + K1 .* RPS_interp_lo;

% construct "high" RPM model
RPS_interp_hi = linspace(ls_RPS(1),ls_RPS(end));
% compute power estimates at the interpolated RPS values
P_W_interp_hi = c(1) * ones(size(RPS_interp_hi));
for i = 1:N2-1
    P_W_interp_hi = P_W_interp_hi + c(i+1) .* RPS_interp_hi.^(i);
end


figure(1), clf, hold on, grid on, box on
plot(RPS2RPM.*RPS_interp_lo,1e3.*P_W_interp_lo,'r','LineWidth',1)
plot(RPS2RPM.*RPS_interp_hi,1e3.*P_W_interp_hi,'r','LineWidth',1)
plot(data_RPM,1e3.*data_P_W,'k*','MarkerSize',6)
set(gca,'fontsize',12)
xlabel('Wheel RPM','fontsize',15)
ylabel('Zero-Torque Power [mW]','fontsize',15)

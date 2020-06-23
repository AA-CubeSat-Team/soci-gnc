clear;

V = 5;              % driving voltage
R = 23.2;           % ohms
L = 0.15;            % Henry
tau = L/R;          % time constant [s]
m_max = 0.0515;     % max dipole
i_ss    = (V/R);    % steady state current
NA = m_max/i_ss;    % product of num turns (N) and enclosed area (A)

d = linspace(0,1);
figure(1), clf, hold on, grid on, box on
for k = 50:50:1000
    T = tau/k;
    Irip = d.*(V/R).*( 1 - exp(-(T/tau).*(1-d)) );
    plot(d,Irip,'LineWidth',1)
end

figure(2), clf, hold on, grid on, box on
d = 0.5;
f_PWM = 1000:250:25000;
T_PWM = 1./f_PWM;
frac = tau./T_PWM;
Irip = d.*(V/R).*( 1 - exp(-(1./frac).*(1-d)) );
del_m = NA .* Irip;
plot(f_PWM./1000,Irip.*1000,'k','LineWidth',2);
xlabel('PWM frequency at 50\% duty cycle [kHz]','Interpreter','latex','FontSize',14)
ylabel('Ripple current [mA]','Interpreter','latex','FontSize',14)
yyaxis right
plot(f_PWM./1000,del_m*1000,'LineWidth',2)
ylabel('Dipole error [mAm$^2$]','FontSize',14)
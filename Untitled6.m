



clear all
close all
clc
w = 0:0.01:200000;

wn = 250*2*pi;
z = 0.01;
b = 1;
m = b;

G = ((b/m).*w.^2)./(sqrt((wn^2-w.^2).^2 + (2*z*wn).^2));
T = 2.5/1000;
t = 0:0.000001:2.5/1000;

k = find(t==1/1000);
u = heaviside(t) - heaviside(t-1/1000);

wn = 250*2*pi;
num = [1 0 0];
den = [1 2*z*wn wn^2];
sys = tf(num,den);


% figure
% loglog(w,G);
% grid on
% xlabel('\omega (rad/s)')
% ylabel('Amplification')

[y,w] = lsim(sys,u,t);

figure
plot(t,y);
grid on
xlabel('time')
ylabel('output')

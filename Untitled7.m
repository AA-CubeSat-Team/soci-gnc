

% I1 = 10;
% I2 = 30;
% k1 = 8e5;
% k2 = 12e5;
% k3 = 5e5;
% 
% M =diag([I1;I2]);
% K = [k1+k2, -k2;-k2,k2+k3];
% 
% [V,D] = eig(K,M)

m1 =4;
m2 = 20;
m3 = 2;
k1 = 14;
k2 = 2;
k3 = 6;
k4 = 2;
M =diag([m1;m2;m3]);
K = [k1+k2, -k2,0;-k2,k2+k3,-k3;0,-k3,(k3+k4)];

 [V,D] = eig(K,M);
C = eye(3);
B = [0;0;1];
D = zeros(3,1);
syms s
G = inv(M*s^2 + K)*B

den = ([20 0 168 0 365 0 52]);
num1 = 0.5;
num2 = ([1 0 4]);
num3 = 3;
opts = bodeoptions('cstprefs');
opts.PhaseVisible = 'off';
sys1 = tf(num1,den)
sys2 = tf(num2,den);
sys3 = tf(num3,den)
figure
hold on
num1 = [20 0 88 0 31]
% bode(sys1,opts)
[mag1,phase1,wout1] = bode(sys1);
[mag2,phase2,wout2] = bode(sys2);
[mag3,phase3,wout3] = bode(sys3);
figure
hold on
subplot(3,1,1)
loglog(wout1,squeeze(mag1))
text(0.371217382603842,10e-2,'\uparrow First pole')
text(2.0,10e-3,'\uparrow 2nd pole')
title('Bode plot for x_1')
ylabel('Mag.')
xlabel('\omega')

subplot(3,1,2)
loglog(wout2,squeeze(mag2))
text(0.371217382603842,10e-2,'\uparrow First pole')
text(1.9,10e-17,'\uparrow First zero')
text(2.0,10e-3,'\uparrow 2nd pole')
title('Bode plot for x_2')
ylabel('Mag.')
xlabel('\omega')

subplot(3,1,3)
loglog(wout3,squeeze(mag3))
text(0.371217382603842,10e-2,'\uparrow First pole')
text(2.0,10e-3,'\uparrow 2nd pole')
title('Bode plot for x_3')
ylabel('Mag.')
xlabel('\omega')
% bode(sys3,opts)


% p  = [1 0 4];
% r = roots(p)

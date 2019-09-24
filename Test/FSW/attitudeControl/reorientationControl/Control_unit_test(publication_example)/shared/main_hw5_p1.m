% AA528 HW5
%
% Problem 1
clear variables; close all

% load constants
addpath('Q_lib/')
constants

N   = 100;
w0  = [0.001; 0.02; 1];
J   = [ 98  0.0 0.0;
      0.0 102 0.0;
      0.0 0.0 150 ];
err = DEG2RAD * 0.5;
Jxy = 0.5*(J(1,1)+J(2,2));
wz_max = 1:5;

wxy = linspace(0,0.5,N);
wz  = (Jxy/(J(3,3)*tan(err))).*wxy;

nut = zeros(5,N);
wxy = linspace(0,0.5,N);
for k = 1:5
    nut(k,:) = RAD2DEG .* atan( (Jxy/(J(3,3)*wz_max(k))) .* wxy );
end

figure, hold on, grid on
plot(wxy,wz)
xlabel('Transverse Angular Velocity: $\omega_{xy}$ [rad/s]')
ylabel('Axial Angular Velocity: $\omega_z$ [rad/s]')

figure, hold on, grid on
for k = 1:5
    plot(wxy,nut(k,:))
end
legend('\omega_z=1','\omega_z=2','\omega_z=3','\omega_z=4','\omega_z=5')
ylim([0 1])
plot(get(gca,'xlim'),[RAD2DEG*err RAD2DEG*err],'k--')
xlabel('Transverse Angular Velocity: $\omega_{xy}$ [rad/s]')
ylabel('Nutation Angle [deg]')

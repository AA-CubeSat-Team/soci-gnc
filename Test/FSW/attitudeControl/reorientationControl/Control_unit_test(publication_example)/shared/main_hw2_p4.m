% AA528 HW2
%
% Problem 4 - Design 
clear variables; close all

% load constants
addpath('shared/')
constants;

% orbit parameters
r_p = 180e3 + rE; % m
i   = 5; % Kourou launch site [deg]
mi  = 1200 + 250; % kg
Isp = 300;
alpha = 1/(9.806 * Isp);

% part (a)
a = (muE/wE^2)^(1/3);

% part (c)
r_a = a; % m
v_a = sqrt( (2*muE*r_p)/(r_a*(r_p+r_a)) ); % m/s
dv_1 = 2*v_a*sind(0.5*i); % m/s

% part (d)
v_f = sqrt(muE/r_a); % m/s
dv_f = (v_f - v_a); % m/s

% combined \Delta V
DV1 = dv_f + dv_1;
mf1 = mi * ( exp(alpha*DV1) - 1 );

% part (e)
DV2 = sqrt( v_a^2 + v_f^2 - 2*v_a*v_f*cosd(i) );
mf2 = mi * ( exp(alpha*DV2) - 1 );

% part (f)
% min occurs at 5 deg, as computed here.

% part (g)
T   = 2*pi * sqrt((a^3)/muE);
e   = (r_a-r_p)/(r_a+r_p);
O   = 0;    % assumed (anything is okay)
w   = 180;  % [deg]
M   = 0;    % start the orbit here, simulate once around!
[r_km,v_kmps,~] = coe2rv(a,e,i,O,w,M);

% simulate the first orbit
x0      = [ r_km; v_kmps ] * KM2M;
[T1,X1] = ode45(@(t,x)f_two_body(t,x),[0 T],x0);

% Change velocity using combined maneuver delta V
[r_a_km,v_a_kmps,~] = coe2rv(a,e,i,O,w,180);
r_a     = r_a_km * KM2M;
v_a     = v_a_kmps * KM2M;
u_r     = r_a./norm(r_a);                       % radial direction
C       = axang2rotm([u_r',-DEG2RAD*(i+4)]); % rotate about r
r2      = r_a;
u_v     = C*v_a./norm(v_a);
v2      = v_a + DV2*u_v;

% Propagate new position and velocity
[a2,e2,i2,~,~,~,~] = rv2coe(r2*M2KM,v2*M2KM);
x0      = [ r2; v2 ];
T2      = 2*pi * sqrt((a2^3)/muE);
[~,X2]  = ode45(@(t,x)f_two_body(t,x),[0 T2],x0);

% plot
[xs,ys,zs] = sphere(100);
C   = [131,146,159]./255;
X1 = X1./rE;
X2 = X2./rE;
r_a = r_a./rE;

figure, hold on, grid on
plot3(X1(:,1),X1(:,2),X1(:,3),'LineWidth',2)
plot3(X2(:,1),X2(:,2),X2(:,3),'--','LineWidth',2)
plot3(r_a(1),r_a(2),r_a(3),'ro','MarkerSize',7,'MarkerFaceColor','r')
surf(xs,ys,zs,'LineStyle','none','FaceAlpha',0.9,...
        'FaceLighting','gouraud','FaceColor',C);
xlabel('$\mathbf{x}_{\mathcal{I}} \ [R_e]$')
ylabel('$\mathbf{y}_{\mathcal{I}} \ [R_e]$')
zlabel('$\mathbf{z}_{\mathcal{I}} \ [R_e]$')
axis equal; view(3)
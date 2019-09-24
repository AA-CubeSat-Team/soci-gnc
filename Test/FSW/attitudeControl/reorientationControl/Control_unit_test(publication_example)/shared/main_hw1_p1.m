% AA528 HW1
%
% Design
clear variables; close all

% load constants
constants;

% position & velocity
r_km = [3829.45; -888.41; 5459.13]; % km
v_kmps = [ 2.5396; 7.2434; -0.6063 ]; % km/s

% (a)
v   = v_kmps * KM2M;
r   = r_km * KM2M;
E   = 0.5 * dot(v,v) - muE / norm(r);
rdotv = dot(r,v);
% E is negative and r/v not orthogonal, so the orbit is an ellipse

% (b)
[a,e,i,O,w,M,exitflag] = rv2coe(r_km,v_kmps);

% (c) 
% see ebar in rv2coe.m
ebar = [ 0.000437839215070346
         0.000285695462849594
         0.000415186188826633 ];

% (d)
% see hbar in rv2coe.m
hbar = [ -39004019259
          16185802083
          29994444166 ]; % m2/s2

% (e)
rp = a*(1-e);
ra = a*(1+e);
vp = sqrt(2*muE*(1/rp - 1/(ra+rp)));
va = sqrt(2*muE*(1/ra - 1/(ra+rp)));

u_e = ebar./norm(ebar);
u_h = hbar./norm(hbar);
u_vp = cross(u_h,u_e);

% (f)
T = 2*pi * sqrt((a^3)/muE);

% (e)
x0 = [ r; v ];
[t,X] = ode45(@(t,x)f_two_body(t,x),[0 T],x0);

R = X(:,1:3) / rE;
V = X(:,4:6) / rE;

% Plot results of (e)
[xs,ys,zs] = sphere(100);
C   = [131,146,159]./255;

figure, hold on, grid on
plot3(R(:,1),R(:,2),R(:,3),'k','LineWidth',2)
surf(xs,ys,zs,'LineStyle','none','FaceAlpha',0.9,...
        'FaceLighting','gouraud','FaceColor',C);
xlabel('$\mathbf{x}_{\mathcal{I}} \ [R_e]$')
ylabel('$\mathbf{y}_{\mathcal{I}} \ [R_e]$')
zlabel('$\mathbf{z}_{\mathcal{I}} \ [R_e]$')
set(get(gca,'zlabel'),'rotation',0,...
    'HorizontalAlignment','center','VerticalAlignment','top')
set(get(gca,'ylabel'),'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
% manually set viewing angle


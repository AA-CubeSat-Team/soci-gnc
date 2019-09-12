% AA528 HW3
%
% Design
clear variables; close all

% load constants
constants

tf = 3600;

% ISS orbit
a1 = 400e3 + rE;
e1 = 0.0;
i1 = 51.64;
O1 = 7.7208;
w1 = 292.1673;
M1 = 0.3;

[r_iss_km,v_iss_kmps] = coe2rv(a1,e1,i1,O1,w1,M1);

% s/c orbit
r_p = 400e3 + rE;
r_a = 480e3 + rE;
a   = 0.5*(r_p + r_a);
e   = (r_a-r_p)/(r_a+r_p);
i   = 51.77;
O   = 7.6;
w   = 292.1673;
M   = 0;

[r_sc_km,v_sc_kmps] = coe2rv(a,e,i,O,w,M);

v_sc1 = norm(v_sc_kmps);
v_sc2 = sqrt(muE/r_p) * M2KM;
m_v1  = abs(v_sc1 - v_sc2); % magnitude
d_v1  = -v_sc_kmps./norm(v_sc_kmps); % direction
DV_1  = m_v1 .* d_v1; % inertial thrust vector

% new orbital params
r_sc2_km    = r_sc_km;
v_sc2_kmps  = v_sc_kmps + DV_1;
[a,e,i,O,w,M] = rv2coe(r_sc2_km,v_sc2_kmps);

% Compute DCM from ECI to Hill frame
xH  = v_iss_kmps./norm(v_iss_kmps);
zH  = r_iss_km./norm(r_iss_km);
yH  = cross(zH,xH)./norm(cross(zH,xH));
C_I2H = [ xH'; yH'; zH' ]; % ECI to Hill

% Relative state in Hill frame
n   = sqrt(muE/a1^3);       % mean motion of ISS orbit
drI = r_sc2_km - r_iss_km;  % inertial relative position
drH = C_I2H * drI;          % Hill frame relative position
dvI = v_sc2_kmps - v_iss_kmps;          % inertial relative velocity
dvH = C_I2H * dvI - cross([0;n;0],drH); % Hill frame relative velocity

% compute A matrix 
A   = A_hcw(tf,n);
A11 = A(1:3,1:3);
A12 = A(1:3,4:6);
A21 = A(4:6,1:3);
A22 = A(4:6,4:6);

% compute first delta_v to match final positions
vH_tm = dvH;            % relative velocity at time t^-
vH_tp = -A12\A11*drH;   % relative velocity at time t^+
DV_2  = vH_tp - vH_tm;  % first impulsive delta v vector

% compute second delta_v to match correct relative speed
vH_tfm = A21*drH + A22*vH_tp;   % rel. vel. at time tf^-
vH_tfp = [0.001;0;0];           % rel. vel. at time tf^+
DV_f    = vH_tfp - vH_tfm;      % second impulsive delta v vector

% total delta v (magnitude)
dv_tot = norm(DV_1) + norm(DV_2) + norm(DV_f);

% simulation
N   = tf;
T   = linspace(0,tf,N);
X   = zeros(6,N);
X(:,1) = [ drH; vH_tp ];
for k = 2:N
    tk = T(k);
    Ak = A_hcw(tk,n);
    X(:,k) = Ak * X(:,1);
end

% part (h) - BONUS
syms n t A real
A = [ -3*t+(4/n)*sin(n*t) 0.0             (2/n)*(cos(n*t)-1);
      0.0                 (1/n)*sin(n*t)  0.0;
      (2/n)*(1-cos(n*t))  0.0             (1/n)*sin(n*t) ]; 
detA = simplify(det(A));

figure
subplot(2,2,1), hold on, grid on
plot3(X(1,2:end),X(2,2:end),X(3,2:end),'b')
plot3(0,0,0,'k*','MarkerSize',5);
plot3(X(1,2),X(2,2),X(3,2),'b*','MarkerSize',5);
xlabel('$\mathbf{x}_{\mathcal{H}}$ [m]')
ylabel('$\mathbf{y}_{\mathcal{H}}$ [m]')
zlabel('$\mathbf{z}_{\mathcal{H}}$ [m]')
legend('Trajectory','ISS','s/c')
view(3)
subplot(2,2,2), hold on, grid on
plot3(X(1,2:end),X(2,2:end),X(3,2:end),'b')
plot3(0,0,0,'k*','MarkerSize',5);
plot3(X(1,2),X(2,2),X(3,2),'b*','MarkerSize',5);
xlabel('$\mathbf{x}_{\mathcal{H}}$ [m]')
ylabel('$\mathbf{y}_{\mathcal{H}}$ [m]')
zlabel('$\mathbf{z}_{\mathcal{H}}$ [m]')
view(90,0)
subplot(2,2,3), hold on, grid on
plot3(X(1,2:end),X(2,2:end),X(3,2:end),'b','LineWidth',1)
plot3(0,0,0,'k*','MarkerSize',5)
plot3(X(1,2),X(2,2),X(3,2),'b*','MarkerSize',5);
xlabel('$\mathbf{x}_{\mathcal{H}}$ [m]')
ylabel('$\mathbf{y}_{\mathcal{H}}$ [m]')
zlabel('$\mathbf{z}_{\mathcal{H}}$ [m]')
view(0,90)
subplot(2,2,4), hold on, grid on
plot3(X(1,2:end),X(2,2:end),X(3,2:end),'b','LineWidth',1)
plot3(0,0,0,'k*','MarkerSize',5)
plot3(X(1,2),X(2,2),X(3,2),'b*','MarkerSize',5)
xlabel('$\mathbf{x}_{\mathcal{H}}$ [m]')
ylabel('$\mathbf{y}_{\mathcal{H}}$ [m]')
zlabel('$\mathbf{z}_{\mathcal{H}}$ [m]')
view(0,0)

function A = A_hcw(t,n)

    A11 = [ 1.0     0.0      6*(sin(n*t)-n*t);
            0.0     cos(n*t) 0.0;
            0.0     0.0      4-3*cos(n*t) ];
        
    A12 = [ -3*t+(4/n)*sin(n*t) 0.0             (2/n)*(cos(n*t)-1);
            0.0                 (1/n)*sin(n*t)  0.0;
            (2/n)*(1-cos(n*t))  0.0             (1/n)*sin(n*t) ];
        
    A21 = [ 0.0     0.0         6*n*(cos(n*t)+1);
            0.0     -n*sin(n*t) 0.0;
            0.0     0.0         3*n*sin(n*t) ];
        
    A22 = [ 4*cos(n*t)-3    0.0         -2*sin(n*t);
            0.0             cos(n*t)    0.0;
            2*sin(n*t)      0.0         cos(n*t) ];
        
    A = [ A11 A12; A21 A22 ];
end
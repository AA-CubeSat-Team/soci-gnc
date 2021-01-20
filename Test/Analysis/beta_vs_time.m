clear;

% Earth parameters
rE  = 6378.137;         % km
muE = 3.986004418e5;    % km3/s2
J2E = 1.0826e-3;
SEC2DAY = 1 / 86400;

% Orbit information and period
h   = 550;                      % km
sma = rE + h;                   % semi major axis [km]
inc = deg2rad(0);            % inclination [rad]
mnm = sqrt( muE/sma^3 );        % mean motion [rad/s]
ecc = 0;                        % eccentricity
sla = sma * (1-ecc^2) ;         % semilatus rectum [km]
T   = (2*pi/mnm) / 60;          % orbital period [min]

% inclination for sun-sync orbit
dRAAN_dt_sso = deg2rad(360/365.242199) * SEC2DAY;
inc_sso      = acos( - dRAAN_dt_sso / (1.5*J2E*mnm*(rE/sla)^2) );
inc          = inc_sso;

% Number of orbits to run sim for & epoch
N_orbit  = 0.5 * 16 * 365;
JD_epoch = juliandate(2022,4,1,0,0,0);

% Precession of orbital plane [rad/s]
dRAAN_dt = -1.5 * J2E * mnm * (rE/sla)^2 * cos(inc);

% Compute beta angle and eclipse ratio over time
time_s = linspace(0,N_orbit*T,1000) .* 60;
time_d = time_s .* SEC2DAY; 
% initial right ascension [rad]
raan0  = [0; pi/4; pi/2; pi; 5*pi/4; 3*pi/2; 7*pi/4]; 

BETA = zeros(numel(raan0),length(time_s));
ECLP = zeros(numel(raan0),length(time_s));
RAAN = zeros(numel(raan0),length(time_s));
for k = 1:numel(time_s)
    % compute current value of right ascension of orbit
    RAAN(:,k) = rem( raan0 + dRAAN_dt * time_s(k), 2*pi);
    % compute current right ascension/declination of sun
    JD = JD_epoch + time_d(k);
    [~,sun_eclplon,sun_oblqty] = sun(JD);
    % compute beta angle
    BETA(:,k) = asin( cos(sun_eclplon).*sin(RAAN(:,k)).*sin(inc) ...
                - sin(sun_eclplon).*cos(sun_oblqty).*cos(RAAN(:,k)).*sin(inc) ...
                + sin(sun_eclplon).*sin(sun_oblqty).*cos(inc) );
    temp    = sqrt(h^2 + 2*rE*h) ./ (cos(BETA(:,k)).*(rE+h));
    ECLP(:,k) = 1/180 .* acosd( saturate(temp,-1,1) );
end

% create figure
legbl = cell(1,numel(raan0));
for k = 1:numel(raan0)
    legbl{k} = strcat(num2str(rad2deg(raan0(k))),' deg');
end

figure(1), clf, hold on, grid on, box on
plot(time_d,rad2deg(BETA),'LineWidth',2,'MarkerSize',5)
hleg = legend(legbl,'FontSize',14,'Interpreter','latex','location','southwest');
hleg.Title.String = 'RAAN, $\Omega$';
ylabel('$\beta$ angle [deg]','FontSize',15,'Interpreter','latex')
xlabel('Time Since Epoch [days]','FontSize',15,'Interpreter','latex')
title('Epoch: April 1, 2020','FontSize',16,'Interpreter','latex')

figure(2), clf, hold on, grid on, box on
plot(time_d,ECLP.*T,'LineWidth',2,'MarkerSize',5)
hleg = legend(legbl,'FontSize',14,'Interpreter','latex','location','southwest');
hleg.Title.String = 'RAAN, $\Omega$';
ylabel('Eclipse time [min]','FontSize',15,'Interpreter','latex')
xlabel('Time [days]','FontSize',15,'Interpreter','latex')
title('Epoch: April 1, 2020','FontSize',16,'Interpreter','latex')

% print(gcf,'eclipse_v_beta','-dpng','-r350')


function y = saturate(u,low,high)
    y = u;
    for k = 1:numel(u)
        if ( y(k) < low )
            y(k) = low;
        end
        if ( y(k) > high )
            y(k) = high;
        end
    end
end
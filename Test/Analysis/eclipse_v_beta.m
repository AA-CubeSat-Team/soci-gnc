clear;

% Earth parameters
rE  = 6378.137;         % km
muE = 3.986004418e5;    % km3/s2

% Orbit altitude and period
h   = 550;              % km
T   = 2*pi*sqrt( (rE+h)^3/muE ) / 60;

% Critical beta angle at which T_eclipse = 0
b_crit = asin( rE / (rE + h) );

% Compute eclipse factors as a function of beta
beta = linspace(0,b_crit);
temp = sqrt(h^2 + 2*rE*h) ./ (cos(beta).*(rE+h));
f_e  = 1/180 .* acosd( saturate(temp,-1,1) );

figure(1), clf, hold on, grid on, box on
plot(rad2deg(beta),f_e.*T,'k','LineWidth',2,'MarkerSize',5)
plot(rad2deg([b_crit,b_crit]),get(gca,'YLim'),'r--','LineWidth',2)
legend('Altitude: $550$ km','$\beta^*$: No eclipse for $\beta > \beta^*$',...
    'FontSize',14,'Interpreter','latex','location','southwest')
xlabel('$\beta$ angle [deg]','FontSize',15,'Interpreter','latex')
ylabel('Eclipse Time [min]','FontSize',15,'Interpreter','latex')

print(gcf,'eclipse_v_beta','-dpng','-r350')


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
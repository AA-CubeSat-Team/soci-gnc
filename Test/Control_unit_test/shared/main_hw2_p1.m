% AA528 HW2
%
% Problem 1
clear variables; close all

% load constants
constants;

% orbit parameters
y = 500; % r3/r1

x = 1.5:0.01:10; % r2/r1
sz = length(x);

frac    = 2./(1+x);
hohmann = sqrt(1./x) - 1 - sqrt((1./x).*frac) + sqrt(x.*frac);

c1      = sqrt((2*y)/(1+y)) - 1;
c2      = sqrt(2/y);
c3      = sqrt(1/(1+y));
biellip = c1 + c2.*( sqrt(x./(x+y)) - c3 ) + ...
                                sqrt(1./x) .* ( sqrt((2*y)./(x+y)) - 1 );

[val,i] = min(abs(hohmann(1:floor(sz/2)) - biellip(1:floor(sz/2))));
cross   = x(i);
        
figure, hold on, grid on
plot(x,hohmann)
plot(x,biellip)
xlabel('$r_2/r_1$')
ylabel('$\Delta v / v_1$')
legend('Hohmann','Bi-elliptic')




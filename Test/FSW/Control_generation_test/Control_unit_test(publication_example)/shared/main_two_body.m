constants;

% initial conditions
r0 = [500e3+rE; 0; 0];
v0 = [0; 0; 7.7] * KM2M;
x0 = [ r0; v0 ];
tspan = [0 5400];

[T,X] = ode45(@(t,x)f_two_body(t,x),tspan,x0);

% plot
figure, hold on, grid on
plot3(X(:,1),X(:,2),X(:,3))
view(3)
function [ dx ] = f_two_body( t,x )

% states
r = x(1:3);
v = x(4:6);

% compute gravity
g = gravity('earth','kepler',r);

% differential
dx = [ v; g ];

end


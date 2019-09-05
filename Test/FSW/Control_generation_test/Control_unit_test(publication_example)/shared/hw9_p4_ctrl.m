function [ u ] = hw9_p4_ctrl( t,x,P )

q = x(1:4);
w = x(5:7);
J = P.inertia;

u = P.mu*skew(w)*J*w - P.Kp*q(1:3) - P.Kd*w;

end


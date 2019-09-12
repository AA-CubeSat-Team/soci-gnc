function [ dx ] = Q_ode( P,t,x,u,ut )
%Q_ODE  Rotational equations of motion
%
% Q_ode(P,t,x,u) outputs the RHS of the quaternion based attitude
% kinematics and dynamics. It assumes that t is the current time, x is the
% state vector containing q (4x1) and w (3x1). u is the control input, a
% 3x1 vector, and P is a set of parameters (must include inertia matrix).
% 
% Q_ode(P,t,x,u,ut) takes the vector input of 'control times' ut and
% interpolates the current control u based on the time t. The method is
% assumed to be a first order hold.
%
% T.Reynolds -- RAIN Lab

% States
q   = x(1:4);
q   = q./norm(q);
w   = x(5:7);

% Get control
if( nargin < 5 )
    if (ischar(u))
        uu = feval(u,t,x,P);
    else
        uu = u;
    end
else
    uu = interp1(ut,u',t,method)';
end
    
% Kinematics
dq  = 0.5*Q_mult(q,[w;0]);
% Dynamics
dw  = P.inertia\(uu - skew(w)*P.inertia*w);

% Output
dx  = [ dq; dw ];

end


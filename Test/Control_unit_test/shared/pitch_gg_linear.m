function [ dx ] = pitch_gg_linear( t,x,P )

% state values
theta  = x(1);
dtheta = x(2);

% error signal
err = P.theta_cmd - theta;

% control signal
u = P.kp * err - P.kd * dtheta;

% state derivatives
dx    = zeros(2,1);
dx(1) = dtheta;
dx(2) = (3*P.n^2*(P.Jx-P.Jz)/P.Jy)*theta + u/P.Jy + P.tau_d/P.Jy;

end


function [ dx ] = sim_cassini( t,x,P )
%SIM_CASSINI
%
% T. Reynolds -- RAIN Lab

q   = x(1:4);
w   = x(5:7);
hw  = x(8:10);

% Control law
q_err   = Q_mult(Q_conj(q),P.q_cmd);
u       = -P.Kp * (q_err(4).*q_err(1:3)) + P.Kd * w + skew(w)*(P.J*w+hw);

dq  = 0.5 * Q_mult(q,[w;0]);
dhw = u;
dw  = P.J \ (P.tau_d - dhw - skew(w) * ( P.J * w + hw) );

dx  = [ dq; dw; dhw ];

end


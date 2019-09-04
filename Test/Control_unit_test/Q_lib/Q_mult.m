function [ qxp ] = Q_mult( q,p )

% Multiplies two quaternions according to a SCALAR LAST convention.
% T. Reynolds, RAIN Lab, 8.2.17

if length(q) ~= 4 || length(p) ~= 4
    error('One of the input vectors is not a quaternion')
end

q   = reshape(q,4,1);
p   = reshape(p,4,1);

qv  = q(1:3);
q0  = q(4);
pv  = p(1:3);
p0  = p(4);

qxp_v   = p0*qv + q0*pv + skew(qv)*pv;
qxp_0   = q0*p0 - pv'*qv;

qxp     = [ qxp_v; qxp_0 ];


end


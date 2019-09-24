function [ q_star ] = Q_star( q )

% Conjugates a quaternion

if length(q) ~= 4
    error('Input is not a quaternion')
end

q = reshape(q,4,1);

q_v     = q(1:3);
q0  = q(4);

q_star  = [-q_v; q0];


end


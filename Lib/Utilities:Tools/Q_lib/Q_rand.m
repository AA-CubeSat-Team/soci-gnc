function [ q ] = Q_rand( )
% Computes a random unit quaternion

q   = randn(4,1);
q   = q./norm(q);

end


function [ logq ] = Q_log( q )

% Computes the logarithm of a (unit) quaternion
% T. Reynolds, RAIN Lab
% Updated: 9.27.17

if length(q) ~= 4
    if length(q) == 3
        q   = reshape(q,3,1);
        q   = [q;0];
    else
        error('Input is not a quaternion')
    end
end

q   = reshape(q,4,1);

q0  = q(4);
qv  = q(1:3);

ang2     = acos(q0);

sang2   = sin(ang2);

if ang2 ~= 0
    n   = qv./sang2;
else
    n = zeros(3,1);
end

logq    = [n.*ang2; 0];


end


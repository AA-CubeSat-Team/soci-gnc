function [ q_cross ] = Q_cross( q )

if length(q) ~= 4
    error('Input vector is not a quaternion')
end

q   = reshape(q,4,1);

q0  = q(4);
qv  = q(1:3);

qv_skew  = skew(qv);

q_cross     = [ qv_skew+q0*eye(3)   qv;
                zeros(1,3)          0 ];  

end


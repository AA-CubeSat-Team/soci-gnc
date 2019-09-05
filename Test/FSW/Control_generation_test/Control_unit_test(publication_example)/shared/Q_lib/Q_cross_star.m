function [ q_cross_star ] = Q_cross_star( q )

if length(q) ~= 4
    error('Input vector is not a quaternion')
end

q   = reshape(q,4,1);

q0  = q(4);
qv  = q(1:3);

qv_skew  = skew(qv);
qv_skew_T  = qv_skew';

q_cross_star     = [ qv_skew_T+q0*eye(3)   qv;
                        zeros(1,3)          0 ];  

end



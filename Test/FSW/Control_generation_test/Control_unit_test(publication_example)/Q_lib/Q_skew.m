function [ q_skew ] = Q_skew( q )

if length(q) ~= 4
    if length(q) == 3
        q   = reshape(q,3,1);
        q   = [q; 0];
    else
        error('Input is not a quaternion')
    end
end

q   = reshape(q,4,1);

qv  = q(1:3);
q0  = q(4);

qv_skew     = skew(qv);

q_skew  = [ qv_skew + q0*eye(3)     qv;
            -qv'                    q0 ];

end


function [ q_exp ] = Q_exp( q,t )

% Quaternion exponentiation
% T. Reynolds, RAIN Lab
% Updated: 9.5.17

if length(q) ~= 4
    if length(q) == 3
        q = reshape(q,3,1);
        q = [q; 0];
    else
        error('Input is not a quaternion')
    end
end

q = reshape(q,4,1);

qv = q(1:3);
q0 = q(4);

tht2     = acos(q0);

n_hat   = qv./norm(qv);
logq    = [n_hat*tht2; 0];

tlogq   = t*logq;

tht     = norm(tlogq);

if tht < 1e-10
    vec     = tlogq(1:3)./1e-10;
else
    vec     = tlogq(1:3)./tht;
end

stht    = sin(tht);
ctht    = cos(tht);

q_exp   = [stht*vec; ctht];

end

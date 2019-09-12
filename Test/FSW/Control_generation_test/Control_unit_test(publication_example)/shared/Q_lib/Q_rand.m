function [ q ] = Q_rand( varargin )
% Computes a random unit quaternion
if( nargin > 0 )
    rng(varargin{1});
end
q   = randn(4,1);
q   = q./norm(q);

end


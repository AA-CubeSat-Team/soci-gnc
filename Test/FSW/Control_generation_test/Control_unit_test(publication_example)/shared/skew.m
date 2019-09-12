function [ X ] = skew( x )
%SKEW 
%
% X = skew(x) returns the skew-symmetric operator (a 3x3 matrix)
% associated to the 3x1 vector x.
%
% T. Reynolds -- RAIN Lab

if ( numel(x) ~= 3 )
    error('SKEW: input x must be 3x1')
end

X = [ 0.0  -x(3)  x(2);
      x(3)  0.0  -x(1)
      -x(2) x(1)  0.0 ];

end


function [ v_skew ] = skew( v )
% ----------------------------------------------------------------------- %
% Computes the 3x3 skew symmetric cross product operator of a vector.
%
% T. Reynolds -- RAIN Lab 8.1.17
% ----------------------------------------------------------------------- %

if( length(v) ~= 3 )
    error('Vector must be 3x1')
end

v_skew  = [ 0       -v(3)   v(2);
            v(3)    0       -v(1);
            -v(2)   v(1)    0 ];

end


function R = rot(angle,axis)
%ROT
% 
%  Compute the rotation matrix that corresponds to a rotation through
%  "angle" radians about the "axis" axis.
%
%   Inputs:
%       - angle [scalar] in radians
%       - axis [string] must be one of 'x', 'y' or 'z'
%
%   Outputs:
%       - R [3x3] rotation matrix
%
% T. P. Reynolds

try
    assert( isequal(axis,'x') || isequal(axis,'y') || isequal(axis,'z') )
catch
    error('Axis input must be one of "x", "y" or "z"')
end

ca = cos(angle);
sa = sin(angle);

switch axis
    case 'x'
        R = [ 1.0, 0.0, 0.0;
              0.0,  ca,  sa;
              0.0, -sa,  ca ];
    case 'y'
        R = [  ca, 0.0, -sa;
              0.0, 1.0, 0.0;
               sa, 0.0,  ca ];
    case 'z'
        R = [  ca,  sa, 0.0;
              -sa,  ca, 0.0;
              0.0, 0.0, 1.0 ];
end

end


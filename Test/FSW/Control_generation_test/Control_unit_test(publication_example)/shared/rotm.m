function [ C ] = rotm( ang,type )
%ROTM
%
% Returns the rotation matrix C associated with the principal rotation
% about the axis 'type' by an angle 'ang'. Possible values for 'type' are:
% 'x', 'y', or 'z'.
%
% Input angle must be in radians.
%
% T. Reynolds -- RAIN Lab

switch type
    
    case 'x'
        
        C = [ 1.0  0.0      0.0;
              0.0  cos(ang) sin(ang);
              0.0 -sin(ang) cos(ang) ];
          
    case 'y'
        
        C = [ cos(ang) 0.0  -sin(ang);
              0.0      1.0  0.0;
              sin(ang) 0.0  cos(ang) ];
          
    case 'z'
        
        C = [  cos(ang) sin(ang) 0.0;
              -sin(ang) cos(ang) 0.0;
               0.0      0.0      1.0 ];
           
    otherwise
        
        error('ROTM: Unknown principal rotation')
        
end


end


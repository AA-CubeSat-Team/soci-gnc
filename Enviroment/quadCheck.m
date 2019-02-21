function [angle] = quadCheck(x,y)
%QUADCHECK Summary of this function goes here
%   All angles are with respect to the positive x-axis


if x >=0 && y>0
%     disp('Quadrant I') 
    angle = acos(x);
elseif x <=0 && y>0
%     disp('Quadrant II') 
    angle = acos(x) ;
elseif x <=0 && y<0
%     disp('Quadrant III') 
    angle = acos(x) + 3/2*pi;
elseif x >=0 && y<0
%     disp('Quadrant IV') 
    angle = 2*pi-acos(x);
else 
%     disp('Origin') 
    angle = 0;
end


    
        
end
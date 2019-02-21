function [angle] = quadCheck(x,y)
%QUADCHECK Summary of this function goes here
%   Detailed explanation goes here

if x >=0 && y>0
%     disp('Quadrant I') 
    angle = acos(x);
elseif x <=0 && y>0
%     disp('Quadrant II') 
    angle = acos(x) + pi/2;
elseif x <=0 && y<0
%     disp('Quadrant III') 
    angle = acos(x) + pi;
elseif x >=0 && y<0
%     disp('Quadrant IV') 
    angle = acos(x) + 3*pi/2;
else 
%     disp('Origin') 
    angle = 0;
end


    
        
end


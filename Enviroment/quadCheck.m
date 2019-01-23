function [angle] = quadCheck(x,y)
%QUADCHECK Summary of this function goes here
%   Detailed explanation goes here

if x >=0 && y>0
%     disp('Quadrant I') 
    angle = acos(x);
elseif x <=0 && y>0
%     disp('Quadrant II') 
    angle = 0;
elseif x <=0 && y<0
%     disp('Quadrant III') 
    angle = 0;
elseif x >=0 && y<0
%     disp('Quadrant IV') 
    angle = 0;
else 
%     disp('Origin') 
    angle = 0;
end


    
        
end


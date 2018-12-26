% AUTHOR: Devan Tormey
% DATE: 12/26/18
function [ Leap ] = Is_Leap( y )

if (mod(y,4) == 0 )
    Leap = 1;
else 
    Leap = 0;
end

end


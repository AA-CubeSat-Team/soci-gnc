% AUTHOR: Devan Tormey
% DATE: 12/26/18
function [days] = years_to_days(y,y_epoch)
    current_year = y_epoch;
    days = 0;
    for i=1:y
        if (Is_Leap(current_year) == 1)
            days = days + 366;
        else
            days = days + 365;
        end
        current_year = current_year + 1;
            
    end

end


% AUTHOR: Devan Tormey
% DATE: 12/26/18
function [howManyLeap,leapYears] = howManyLeap(y_epoch,y)
    currentYear = y_epoch;
    howManyLeap = 0;
    leapYears = [];
    leapIndex = 1;
    for index = 1:y
        if (Is_Leap(currentYear) == 1)
            howManyLeap = howManyLeap + 1;
            leapYears(leapIndex) = currentYear;
            leapIndex = leapIndex + 1;
        end
        currentYear = y_epoch + index;
    end
end


% AUTHOR: Devan Tormey
% DATE: 12/26/18
function [serialDays] = Seconds_to_Days(seconds)
    secDay = 86400;
    serialDays = floor(seconds/secDay);
end


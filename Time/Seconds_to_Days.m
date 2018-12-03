function [serialDays] = Seconds_to_Days(seconds)
    secDay = 86400;
    serialDays = floor(seconds/secDay);
end


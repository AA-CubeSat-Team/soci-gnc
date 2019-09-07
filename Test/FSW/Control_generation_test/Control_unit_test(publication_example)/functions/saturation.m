function [x_out] = saturation_torque(x_in)

x_out = x_in;

n = length(x_in);

for i = 1:n
    if (x_in(i) >= 1)
        x_out(i) = 1;
    elseif(x_in(i) <= -1)
        x_out(i) = -1;
    end
end

end


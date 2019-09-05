function [x_out] = saturation_norm(x_in)


x_out = x_in;

if (norm(x_in, 2) >= 1)
    x_out = x_in/norm(x_in, 2);
end


end


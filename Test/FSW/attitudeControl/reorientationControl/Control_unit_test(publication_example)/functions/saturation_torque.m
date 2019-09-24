function [x_out] = saturation_torque(x_in, sig)


x_out = x_in;

if (sig > 1)
    x_out = x_in/sig;
end


end


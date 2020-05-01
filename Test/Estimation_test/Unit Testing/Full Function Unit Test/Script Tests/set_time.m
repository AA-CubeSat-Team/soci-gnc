function [settling_time] = set_time(q1e,converge_time,dt,t)
ind = find(abs(q1e) > 3.5);

if max(q1e) <=3.5 % within error on first iteration
    settling_time = 0;
elseif min(q1e) > 3.5 %never converges for all t
    settling_time = -1;
elseif max(q1e(converge_time/dt:end)) > 3.5 %  may converge to within error, but after some nominal converegence time
    settling_time = -1;
elseif max(q1e((max(ind)+1):end)) <3.5
    settling_time = t(max(ind)+1);
else
    settling_time = 1000000;
end
end


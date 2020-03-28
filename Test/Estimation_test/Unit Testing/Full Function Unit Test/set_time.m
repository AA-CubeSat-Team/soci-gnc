function [settling_time] = set_time(q1e,converge_time,dt,t)
ind = find(abs(q1e)<=3.5);
        length(ind);
        if isempty(find(abs(diff(ind))~=1)) == 1 
                settling_time = 0;
%         settling_time(1,k) = 0;
        elseif max(abs(q1e(converge_time/dt:end))) > 3.5
                settling_time = -1;
%            settling_time(1,k) = -1;
        else
            ind_linear = find(abs(diff(ind)) ~= 1);
            ind_ind_settling_time = ind(max(ind_linear+1));
                settling_time = t(ind_ind_settling_time);
%                 settling_time(1,k) = t(ind_ind_settling_time);
        end

end


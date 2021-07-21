%% MVS Test
% This test determines how mid value selection (added to the mag and 
% gyro libraries) reduces variance, so that the variance estimates for the
% MEKF are accurate. 
%
% Nick Melville

data = randn(10000000,3);

mid_data = median(data,2);

std = sqrt((var(data(:,1)) + var(data(:,2)) + var(data(:,3)))/3);

std_mid = sqrt(var(mid_data));

ratio = std_mid / std
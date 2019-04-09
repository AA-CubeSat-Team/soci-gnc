clc

utc_test = 137803367

sim('time_test.slx')

tt_out = ymdhms_tt.data

% tol = 1;

% if abs(tt_out - tt_answer) < tol
%     pass = true;

ut1_out = ymdhms_ut1.data




% if pass
%     fprintf('Time test Passed')
% else 
%     fprintf('Time test Failed')
% end
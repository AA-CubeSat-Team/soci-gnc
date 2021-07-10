% testParams_init
%
% Define the initial conditions for tests
%
% Nick Melville

testParams = struct;

testParams.save_figs = true;

% Time given for ACE to go to zero after a gnc mode change (seconds).
testParams.maneuver_time = 45;
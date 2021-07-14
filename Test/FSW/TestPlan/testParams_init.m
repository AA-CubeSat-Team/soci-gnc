% testParams_init
%
% Define the initial conditions for tests
%
% Nick Melville

testParams = struct;

testParams.save_figs = true;
testParams.fileID = fopen('Test_Results', 'w');

% Time given for ACE to go to zero after a gnc mode change (seconds).
testParams.maneuver_time = 45;

% Time given for the attitude determination system to determine the
% attitude
testParams.attitude_acq_time = 5;
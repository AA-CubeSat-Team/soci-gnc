% Unit test for the my_wmm.m function
%
% Uses the test values for the WMM2015v2 that comes with the NOAA 
% 2015v2 COF file. All NOAA (truth) data is given a capital letter variable
% name. All computed data is given a lower case variable name.
%
% T. Reynolds -- RAIN Lab

% load model
mdl = 'my_wmm_test';
load_system(mdl);
set_param(mdl,'StopTime','1')

% test parameters
DYEAR   = [ 2015; 2015; 2015; 2015; 2015; 2015; ...
            2017.5; 2017.5; 2017.5; 2017.5; 2017.5; 2017.5 ];
ALT_M   = 1e3*[ 0; 0; 0; 100; 100; 100; 0; 0; 0; 100; 100; 100 ];
LAT_DEG = [ 80; 0; -80; 80; 0; -80; 80; 0; -80; 80; 0; -80 ];
LON_DEG = [ 0; 120; 240; 0; 120; 240; 0; 120; 240; 0; 120; 240 ];
X_NT    = [ 6636.6; 39521.1; 5796.3; 6323.4; 37538.1; 5612.2; 6605.2; ...
            39569.4; 5864.6; 6294.3; 37584.4; 5674.9 ];
Y_NT    = [ -451.9; 377.7; 15759.1; -477.6; 351.1; 14789.3; -298.7; 252.3; ...
            15764.1; -331.1; 235.7; 14793.1 ];
Z_NT    = [ 54408.9; -11228.8; -52927.1; 52249.1; -10751.1; -50385.8; ...
            54506.3; -11067.9; -52706.1; 52337.8; -10600.5; -50179.5 ];
B_NT    = [ X_NT, Y_NT, Z_NT ];

% test data
numTest = numel(DYEAR);
b_nt    = zeros(size(B_NT));
flag    = NaN(numTest,1);
err     = NaN(numTest,4);

fprintf('Test: x error [nT]  y error [nT]  z error [nT]  net error [nT] \n')
fprintf('---------------------------------------------------------------\n')
for test = 1:numTest
    
    % grab test values
    lat   = LAT_DEG(test);
    lon   = LON_DEG(test);
    alt   = ALT_M(test);
    dyear = DYEAR(test);
    
    % compute magnetic field
    sim(mdl);
    b_nt(test,:) = b_nt_sim(end,:);
    flag(test)   = flag_sim(end);
    
    % compute errors
    err(test,1) = abs(b_nt(test,1)-X_NT(test));
    err(test,2) = abs(b_nt(test,2)-Y_NT(test));
    err(test,3) = abs(b_nt(test,3)-Z_NT(test));
    err(test,4) = norm(b_nt(test,:)-B_NT(test,:));
    
    fprintf('  %02d: dx = %07.2f  dy = %07.2f  dz = %07.2f',...
            test,err(test,1),err(test,2),err(test,3));
    fprintf('  dB = %07.2f\n',err(test));
end
fprintf('---------------------------------------------------------------\n')
fprintf('AVG:  dx = %07.2f  dy = %07.2f  dz = %07.2f  dB = %07.2f\n',...
        median(err(:,1)),median(err(:,2)),median(err(:,3)),median(err(:,4)));

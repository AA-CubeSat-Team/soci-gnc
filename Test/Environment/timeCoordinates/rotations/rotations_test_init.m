% Tested by: Taylor Reynolds
clc

% see vallado pg 234 for first example
% see Vallado (4e) Ex 3-15 on p. 230 for second example
%% Test 1: TEME to ECI Conversion
rteme=[-9060.47373569;4658.70952502;813.68673153];  % km
vteme=[-2.232832783;-4.110453490;-3.157345433];     % km/s

%convert TLE to UTC
doy_J2000 = 182.78495062;
utc_sec = fswParams.constants.convert.DAY2SEC * doy_J2000;

%run sim
sim('rotations_test.slx');

T2I = teme2eci.signals.values(:,:,1);

%compare with vallado results for givn example pg 234
reci  = T2I*rteme;
reci_ans = [ -9059.951282295866; 4659.68026945089; 813.945709006054 ]; 
veci  = T2I*vteme;
veci_ans = [ -2.2333368300000; -4.11014102400000; -3.15733962200000 ];

reci_err = norm(reci-reci_ans);     % km
veci_err = norm(veci-veci_ans);     % km/s

% Print out the errors computed for the TEME to ECI conversion
fprintf('TEME to ECI Conversion:\n')
fprintf('Position error is: %5.4f km\n',reci_err)
fprintf('Velocity error is: %5.4f km/s\n\n',veci_err)

%% Test 2: ECEF to ECI Conversion

recef = [-1033.4793830;7901.2952754;6380.3565958]; % km
vecef = [-3.225636520;-2.872451450;5.531924446];    % km/s

% Date is April 6, 2004 at 07:51:28.386009 (accounting for leap secs)
doy_J2000 = (365*4-0.5) + 97.327411875104167;% + (22/86400);
utc_sec   = fswParams.constants.convert.DAY2SEC * doy_J2000;
simParams.time.DUT1 = -0.4399619;
simParams.time.TAI_offset = 32;

%run sim
sim('rotations_test.slx');

I2F = eci2ecef.signals.values(:,:,1);

%compare with vallado results for givn example pg 234
reci  = I2F'*recef;
reci_ans = [ 5102.508958; 6123.011401; 6378.136928 ]; 
% veci  = I2F*vecef;
% veci_ans = [ -4.74322016; 0.79053650; 5.553375528 ];

reci_err = norm(reci-reci_ans);     % km
% veci_err = norm(veci-veci_ans);     % km/s

% Print out the errors computed for the TEME to ECI conversion
fprintf('ECEF to ECI Conversion:\n')
fprintf('Position error is: %5.4f km\n',reci_err)
% fprintf('Velocity error is: %5.4f km/s\n',veci_err)
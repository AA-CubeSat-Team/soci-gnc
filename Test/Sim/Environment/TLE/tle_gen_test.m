% This file will test our ability to generate store read and interpret a
% tle for the orbit we are given
% for right now it's probably ISS

% AUTHOR: Devan Tormey
% Date: 5/22/2019

t0 = simParams.time.epoch_utc_s;

[YMDHMS,JD,JC] = TimeConversion(t0);

YMDHMS = YMDHMS{1}.';

RAAN = 127.73663; %fuckin whatever RA or RAAN is
INC = 51.95448; % inclination
ECC = 000701; %eccentricity
AOP = 129.59202; % argument of periapsiss
MNM = 67.87516; %Mean anomoly?
MNA = 67.94960; %True anomoly??

[orbit_tle,JD_UTC_epoch] = TLE_gen(YMDHMS, INC, RAAN, ECC, AOP, MNA, MNM);








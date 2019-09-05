%sim 
%Author Kate Williams
clc

%see vallado pg 234 for example

%calculate teme2eci transformation matrix
%year=2000;
%day=179 days into year; June 27th 
%time = 0.78495062 fraction of a day; 18 hours : 50 minutes : 20 seconds 

%=> June 27th, 2000 at 18:50:20 military time

rteme=[-9060.47373569;4658.70952502;813.68673153];%km
vteme=[-2.232832783;-4.110453490;-3.157345433];%km/s

%convert TLE to UTC
utc_sec= 962131820;%test UTC time (June 27th, 2000 6:50:20 pm)

%run sim
sim('teme2eci_test.slx');

%compare with vallado results for givn example pg 234
rpef  = teme2eci(1:3,1:3)*rteme;
%should be [-9059.951282295866;4659.68026945089;813.945709006054]
vpef  = teme2eci(1:3,1:3)*vteme;
%should be [-2.2333368300000;-4.11014102400000;-3.15733962200000]
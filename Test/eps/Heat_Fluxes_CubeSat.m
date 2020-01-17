% This calclulates absorbed heat fluxes due to solar, Earth IR, and albedo
% for simple planar surfaces as a function of orbit angle assuming a circular orbit
% with no inclination. CubeSat is sun oriented when in sun and Earth oriented 
% when in eclipse to maximize/mininimize heat fluxes for hot and cold cases.
% Average CubeSat temperature is also calculated and is only a rough approximation.

clc
close all; clear all;
set(0, 'DefaultLineLineWidth', 2);

show_flux_plot = 0; %1: show flux data plots. 0: do not show plots
show_heat_plot = 0; %1: show total absorbed heat flow data plots. 0: do not show plots
write2file     = 0; %1: write flux data to file. 0: do not write to file
filename       = ["xface.txt","yface.txt","zface.txt","-xface.txt","-yface.txt","-zface.txt"];

%orbital properties
h         =  350; %orbital height [km]
norbits   =    1; %number of orbits
int       =  250; %intervals between datapoints in seconds 

%constants
RE    = 6371;         %radius of the Earth
ME    = 5.98*10^24;   %mass of the Earth is kg
G     = 6.673*10^-11; %gravitational constant [N m^2/kg^2]
Cs    = 1414;         %solar constant [W/m^2]
alb   = .38;          %average albedo varies from 20-40% depending on surface reflectivity

Qint = 3; %orbit average internal heat generated [W] (power)

xangle = -45; %angle [degrees] of x face normal to sun vector (0 faces sun, 180 away, 90 parallel)
yangle =  45;
zangle =  90;
angle = [xangle, yangle, zangle, xangle+180, yangle+180, zangle+180]*pi/180;

%surface finish properties
a = [.88*.7, .86, .94, .13]; %absorptivity for solar cells, anodized rails, PCB mask, and al/FEP SSR, respectively. 
e = [.85,    .85, .9,  .40]; %emissivity for the above surfaces

A = [2686*4, (1776+281)*2,  6436, 0;...
     2686*5, (1776+281)*2,  3881, 0;...
     3008*2,         72*4,  3696, 0;...
     2686*4, (1776+281)*2,  6549, 0;...
     2686*5, (1776+281)*2,  3881, 0;...
          0,            0, 10000, 0]*10^-6; %areas of SP, rails, PCB, SSR for each surface [A is in m^2]
    
%calculate the orbital period
Period = 2*pi*sqrt(((RE+h)*1000)^3/(G*ME)); %orbital period in seconds
time = [(0:int:norbits*Period), norbits*Period]; %change orbit angle form sub solar point to seconds; rounded up to next interval.
r = RE / (RE +h);
eclipse_angle = 90 + acos(r)*180/pi; %+/- angle from subsolar point where eclipse begins/ends
angle0 = -eclipse_angle; %start from just after the cubesat exits the eclipse
theta = 2*pi*time/Period+angle0*pi/180; %orbit angle measured from subsolar point to local zenith in radians
abstheta = theta - 2*pi*round(theta/(2*pi)); %calculates the the angle from the subsolar point in the domain [-pi,pi)


qtotal = zeros(4,length(time));
Q = zeros(1,length(time));
Qside = zeros(6,length(time));

%below here uses radians for all calculations
for side = 1:6
    
    %sets the sun view factor to 0 and rotates the cubesat 180 degrees when
    % eclipsed
    eclipse = theta;
    eclipse(cos(abstheta)<-sqrt(1-r^2))=0; %when eclipsed
    eclipse(eclipse ~= 0)=1; %when in the sun

    %angle from surface normal to local zenith in radians.
    % sun oriented when in sun, Earth oriented when in eclipse to get max/min heat 
    % fluxes for hot and cold cases
    rho =   pi*(1 - eclipse) + angle(side) - abstheta.*eclipse ; 

    %calculate view factor
    FE = r^2.1*abs(sin(rho/2)).^3.45; %Earth view factor


    %calculate fluxes for all the surface properties
    for i=1:4 

        Fs = cos(angle(side)).*eclipse; %sun view factor
        Fs(Fs<0)=0; %set to 0 if not facing the sun

        %heat fluxes [W/m^2]
        qIR = 260*FE; %Earth IR heat flux
        qa  = Cs*alb*FE.*(real(cos(.9*abstheta).^1.5)); %Albedo heat flux
        qS = Cs*Fs; %solar heat flux
        qS(qS<0)=0; qa(qa<0)=0; qIR(qIR<0)=0; %check to ensure no negative heat fluxes

        qtotal(i,:) = round(qIR*e(i) + qa*a(i) + qS*a(i)); %total absorbed heat flux rounded to the nearest [W/m^2]

    end

    if show_flux_plot ==1
        figure('name',filename(side))
        subplot(2,1,1)
        plot(theta*180/pi,qIR,'r',theta*180/pi,qa,'b',theta*180/pi,qS,'y')
        xlabel('Angle from Sub-Solar Point, \theta')
        ylabel('Flux, q [W/m^2]')
        title('Heat Fluxes on a Side')
        legend('q_I_R', 'q_a', 'q_S')

        subplot(2,1,2)
        plot(time,qtotal(1,:),time,qtotal(2,:),time,qtotal(3,:),time,qtotal(4,:))
        xlabel('Time Elapsed, t [s]')
        ylabel('Absorbed Flux, q [W/m^2]')
        title('Absorbed Heat Fluxes on a Side')
        legend('solar cells', 'anodized rails', 'PCB mask', 'al/FEP SSR')
    end

    if write2file == 1
        %output a table of values for heat flux as a function of time
        Table_of_Fluxes = array2table([time;qtotal]',...
            'VariableNames',{'Elapsed_Time','Solar_Cells','Rails','PCB_Mask','SSR'})

        writetable(Table_of_Fluxes,filename(side),'Delimiter',' ') 
    end

%calculates the total absorbed heat flow in Watts of each side and the for
%the CubeSat overall
Qside(side,:) = A(side,:)*qtotal;
Q = Q + A(side,:)*qtotal;
    
end

if show_heat_plot ==1
    figure('name','Total_Heat_Flow')
    plot(time,Q, time, Qside)
    xlabel('Time Elapsed, t [s]')
    ylabel('Absorbed Heat Flow, Q [W]')
    title('Total CubeSat Absorbed Heat')
    legend('Total', 'X', 'Y', 'Z', '-X', '-Y', '-Z')
end

%% Solve the Heat Eqn w/ Radiation to get Average Temperature

%temperature calculation domain is one orbit
tspan = [0 time(end)];
ic = 273; %initial condition: temperature, [K]
tempdiff = ic;

%solves the one-node heat eqn w/ radiation with begining and final temps
% nearly equal so the orbit is cyclical.
while tempdiff>.1
opts = odeset('RelTol',1e-4,'AbsTol',1e-6); %relax tolerance 
[t,y] = ode45(@(t,y) myode(t,y,time,Q,A,e,Qint), tspan, ic, opts);
tempdiff = abs(ic-y(end));
ic = y(end);
end

figure('name','Avg_Temperature')
plot(t/60,y-273.15)
xlabel('Time Elapsed (After Exiting Eclipse), t [min.]')
ylabel('Temperature, T_a_v_g [C]')
title('Average CubeSat Temperature')


function dydt = myode(t,y,time,Q,A,e,Qint) %computes change in temp wrt. time
C = 4154; %CubeSat heat capacity [J/K]
sigma = 5.670367*10^-8; %Stefan–Boltzmann constant
Qext = interp1(time,Q,t); % Interpolate the data set (ft,f) at time t
dydt = (Qext+Qint-sigma*sum(A*e')*(y^4-3^4))/C; %one node heat eqn w/ external radiation
end


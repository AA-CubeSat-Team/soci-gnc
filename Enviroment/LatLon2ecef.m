%Author Ivan Machuca
%Date 1/17/19
%Function takes inputs of geodedic latitude,longitude,and altitude
% and outputs the position vectors in ECEF. 


function [r_ecef] = LatLon2ecef(lat_gd,long,h)
    R_earth = 6378.1363; %Radius of Earth in Km
    e_earth = 0.081819221456; %eccentricty of the earth Pg.132
    
    %Equation 3-7 
    C_earth = R_earth/(sqrt(1-e_earth^2*sind(lat_gd)^2));
    S_earth = R_earth*(1-e_earth^2)/(sqrt(1-e_earth^2*sind(lat_gd)^2));
    
   

    %Equation 3-14
    r_I = (C_earth+h)*cosd(lat_gd)*cosd(long); %position vector in I ECEF
    r_J = (C_earth+h)*cosd(lat_gd)*sind(long); %position vector in J ECEF
    r_K = (S_earth+h)*sind(lat_gd); %position vector in K ECEF
    
   
    
    r_ecef = [r_I r_J r_K]; %Coordinates in ECEF


end
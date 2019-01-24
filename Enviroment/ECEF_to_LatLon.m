function [phi,lamda,he] = ECEF_to_LatLon(r_ecef)
    %ECEF_TO_LA Summary of this function goes here
    %Transforms from a given ECEF radial vector to the latitude and
    %longitude vectors. This uses Algorithm 12 (pg 173)

    tol = .0001;
    
    
    % Defind the IJK radial components  
    rI = r_ecef(1);
    rJ = r_ecef(2);
    rK = r_ecef(3);
    
    %Define radius and eccentricity of earth (note: not e of earths orbit)
    re =  6378.137;
    e = 0.081819221456;

    %This is the magditude of the satellites distance   
    r_dsat = sqrt(rI^2 + rJ^2);

    %Calculate the sin(a) and cos(a)       
    sina = rJ/r_dsat;
    cosa = rI/r_dsat;
    
    %Correct for quadrant error 
    a = quadCheck(cosa,sina);
    
    %once corrected lambda is simply the angle alpha (a)
    lamda = a*180/pi;
    
    end_flag = 0;
    
    %Now solve iteratively for phi    
    phi_old = atan(rK/r_dsat);
    
    %Calculate C for first iteration
    C = re/sqrt(1 - (e^2)*(sin(phi_old)^2) );
    
    tanphid = (rK + C*(e^2)*sin(phi_old))/r_dsat;
    phi_gd = atan(tanphid);
    %print = phi_gd*180/pi  %in case you want to check
    
    %this will break us out of the loop  
    if abs(phi_gd - phi_old) < tol
        end_flag = 1;
  
    else
        phi_old = phi_gd;
        end_flag = 0;
    end
    
    
    while (end_flag == 0)
        C = re/sqrt(1 - (e^2)*(sin(phi_old)^2) );
        tanphid = (rK + C*(e^2)*sin(phi_old))/r_dsat;
        phi_gd = atan(tanphid);
        if abs(phi_gd - phi_old) < tol
            end_flag = 1;
        else
            phi_old = phi_gd;
            end_flag = 0;
        end
    end
    
    C = re/sqrt(1 - (e^2)*(sin(phi_gd)^2) );
    phi = phi_gd*180/pi;
    Se = C*(1 - e^2);
    if phi < 1
        he = rK/(sin(phi_gd)) - Se;
%         print(' < 1 case')
    else
        he = r_dsat/(cosd(phi)) - C;
%         print(' Regular Case ')
    end

end


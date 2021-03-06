function [phi,lamda,he] = ECEF_to_LatLon(r_ecef)
    %ECEF_TO_LA Summary of this function goes here
    %Transforms from a given ECEF radial vector to the latitude and
    %longitude vectors. This uses Algorithm 12 (pg 173)

    tol = .0001; %Tolerance of the iterations
    
    
    % Defind the IJK radial components  
    rI = r_ecef(1);
    rJ = r_ecef(2);
    rK = r_ecef(3);
    
    %Define radius and eccentricity of earth (note: not e of earths orbit)
    re =  6378.1363;
    e = 0.081819221456;

    %This is the magditude of the satellites distance   
    r_dsat = sqrt(rI^2 + rJ^2);

    %Calculate the sin(a) and cos(a)       
    sina = rJ/r_dsat;
    cosa = rI/r_dsat;
    
    %Correct for quadrant error 
    %a = quadCheck(cosa,sina);
    a=atan2(sina,cosa); %This is better and you don't need to learn angles. 
    
    %once corrected lambda is simply the angle alpha (a)
    lamda = a*180/pi;
    
    end_flag = 0;
    
    %Now solve iteratively for phi    
    phi_old = atan2(rK,r_dsat);
    
    %Calculate C for first iteration
    C = re/sqrt(1 - (e^2)*(sin(phi_old)^2) );
    
    %tanphid = (rK + C*(e^2)*sin(phi_old))/r_dsat;
    phi_gd = atan2(rK + C*(e^2)*sin(phi_old),r_dsat);
    %print = phi_gd*180/pi  %in case you want to check
    
    %this will break us out of the loop  
    if abs(phi_gd - phi_old) < tol
        end_flag = 1;
  
    else
        phi_old = phi_gd;
        end_flag = 0;
    end
    
    count = 0;
    
    while (end_flag == 0)
        C = re/sqrt(1 - (e^2)*(sin(phi_old)^2) );
        %tanphid = (rK + C*(e^2)*sin(phi_old))/r_dsat;
        %phi_gd = atan(tanphid);
        phi_gd = atan2(rK + C*(e^2)*sin(phi_old),r_dsat);
        
        if abs(phi_gd - phi_old) < tol
            end_flag = 1;
        else
            phi_old = phi_gd;
            end_flag = 0;
        end
        count = count + 1;
        
        if count >= 100
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
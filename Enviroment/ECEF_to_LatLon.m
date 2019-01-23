function [phi,lamda,he] = ECEF_to_LatLon(r_ecef)
    %ECEF_TO_LA Summary of this function goes here
    %   Transforms from a given ECEF radial vector to the latitude and
    %   longitude vectors. This uses Algorithm 12 (pg 173)

    tol = .0001;
    
    rI = r_ecef(1);
    rJ = r_ecef(2);
    rK = r_ecef(3);

    re =  6378.137;
    e = 0.016708617;


    r_dsat = sqrt(rI^2 + rJ^2);

    sina = rJ/r_dsat;
    cosa = rI/r_dsat;
    
    a = quadCheck(cosa,sina);
    
    lamda = a*180/pi;
    
    end_flag = 0;
    
    phi_old = atan(rK/r_dsat);
    
    C = re/sqrt(1 - (e^2)*(sin(phi_old)^2) );
    
    tanphid = (rK + C*(e^2)*sin(phi_old))/r_dsat;
    phi_gd = atan(tanphid);
%     print = phi_gd*180/pi
    
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


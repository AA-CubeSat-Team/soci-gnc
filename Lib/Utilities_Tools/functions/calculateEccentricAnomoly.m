function E = calculateEccentricAnomoly(M,e)
%CALCULATEECCENTRICANOMOLY Summary of this function goes here
%   Detailed explanation goes here
    tol = .0000001;
    Eo = M;

    E = M + e*sin(Eo);

    Error = abs(Eo - E);
    k = 1;
    while abs(Error) > tol && k < 100
        E = Eo - (Eo - e*sin(Eo) - M)/(1 - e*cos(E));
        k = k + 1;
        Error = Eo - E;
        Eo = E;
    end
    
end


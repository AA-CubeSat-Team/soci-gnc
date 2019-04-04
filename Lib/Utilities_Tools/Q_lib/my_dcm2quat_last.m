function q = my_dcm2quat_last( DCM )

q   = zeros(4,1);

tr  = trace(DCM);

q(4)    = 0.5*sqrt(tr + 1);

if( q(4) ~= 0 )
    eta     = 1/(4*q(4));
    q(1)    = eta*(DCM(2,3) - DCM(3,2));
    q(2)    = eta*(DCM(3,1) - DCM(1,3));
    q(3)    = eta*(DCM(1,2) - DCM(2,1));
else
    q(1)  = sqrt(0.5*(DCM(1,1) + 1));
    q(2)  = sign(DCM(1,2))*sqrt(0.5*(DCM(2,2) + 1));
    q(3)  = sign(DCM(1,3))*sqrt(0.5*(DCM(3,3) + 1));
end

end


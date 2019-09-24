function q = my_dcm2quat_last( DCM )
%MY_DCM2QUAT_LAST Direction Cosine Matrix to Quaternion
%
% my_dcm2quat_last(DCM) returns the 4x1 unit quaternion that corresponds to
% the direction cosine matrix DCM. The function adheres to a Hamiltonian
% scalar-last quaternion convention.
%
% T. Reynolds -- RAIN Lab

q   = zeros(4,1);

cases = zeros(4,1);
cases(1) = 0.5 * sqrt(1 + DCM(1,1) - DCM(2,2) + DCM(3,3));
cases(2) = 0.5 * sqrt(1 - DCM(1,1) + DCM(2,2) - DCM(3,3));
cases(3) = 0.5 * sqrt(1 - DCM(1,1) - DCM(2,2) + DCM(3,3));
cases(4) = 0.5 * sqrt(1 + trace(DCM));

[den,i] = max(cases);

switch i
    
    case 1
        
        q(1) = den;
        q(2) = 0.25*(DCM(1,2)+DCM(2,1))/den;
        q(3) = 0.25*(DCM(1,3)+DCM(3,1))/den;
        q(4) = 0.25*(DCM(2,3)-DCM(3,2))/den;
        
    case 2
        
        q(1) = 0.25*(DCM(1,2)+DCM(2,1))/den;
        q(2) = den;
        q(3) = 0.25*(DCM(2,3)+DCM(3,2))/den;
        q(4) = 0.25*(DCM(3,1)-DCM(1,3))/den;
        
    case 3
        
        q(1) = 0.25*(DCM(1,3)+DCM(3,1))/den;
        q(2) = 0.25*(DCM(2,3)+DCM(3,2))/den;
        q(3) = den;
        q(4) = 0.25*(DCM(1,2)-DCM(2,1))/den;
        
    case 4
        
        q(1) = 0.25*(DCM(2,3)-DCM(3,2))/den;
        q(2) = 0.25*(DCM(3,1)-DCM(1,3))/den;
        q(3) = 0.25*(DCM(1,2)-DCM(2,1))/den;
        q(4) = den;
        
end

end


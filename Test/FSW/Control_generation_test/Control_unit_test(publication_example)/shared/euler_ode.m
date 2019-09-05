function [ dw ] = euler_ode( t,w,sc )
%EULER_ODE
%
% dw = euler_ode(t,w,u,J) returns the right hand side of the Euler's
% equations relating external torque ('u') to the change in angular
% velocity ('w'). Parameter sc is a struct with spacecraft information. 
% This must include at least the inertia matrix J
%
% T. Reynolds -- RAIN LAB

switch sc.control
    
    case true
        
        u_x = - sc.k * sc.J(1,1) * w(1);
        u_y = - sc.k * sc.J(2,2) * w(2);
        u_z = - sc.ks * ( w(3) - sc.nu );
        
        u = [ u_x; u_y; u_z ];
        
    case false
        
        u = [ 0.0; 0.0; 0.0 ];
        
end

dw = sc.J \ (u - skew(w) * sc.J * w);

end


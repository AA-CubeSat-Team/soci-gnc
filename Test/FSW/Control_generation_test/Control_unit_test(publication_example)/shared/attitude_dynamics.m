function [ dx ] = attitude_dynamics( t,x,P,u )
%ATTITUDE_DYNAMICS
%
% Returns the right hand side of the attitude kinematics and dynamics given
% the attitude parameterization stored in P.att_type. The struct P must
% containt at least a 3x3 inertia matrix P.J and a string P.att_type. 
%
% Methods do not include any disturbance torques.
%
% Inputs are:
%   - t : time
%   - x : state (7x1) or (6x1) [ attitude ; angular velocity ]
%   - P : struct containing s/c parameters and options
%   - u (optional) : (3x1) control torques, if omitted will be computed
%   using a PID feedback controller.
%
% T. Reynolds -- RAIN Lab

att_type = P.att_type;
    
switch att_type
    
    case 'quaternion'
        
        q   = x(1:4);
        w   = x(5:7);    
        
        % Control law
        if (nargin < 4)
            if (t>1)
                q_err   = Q_mult(Q_conj(q),P.q_cmd);
                u       = P.Kp * (q_err(4).*q_err(1:3)) - P.Kd * w;
            else
                u   = zeros(3,1);
            end
        end
        
        dq  = 0.5 * Q_mult(q,[w;0]);
        dw  = P.J \ (u - skew(w) * P.J * w);
        
        dx  = [ dq; dw ];
        
    case 'euler_angle'
        
        eul = x(1:3);
        roll    = eul(1);
        pitch   = eul(2);
        yaw     = eul(3);
        w   = x(4:6);
        
        % Control law
        if (nargin < 4)
            if (t>1)
                u = P.Kp * (P.eul_cmd - eul) - P.Kd * w;
            else
                u = zeros(3,1);
            end
        end
        
        deul = [ 1.0 sin(roll)*tan(pitch) cos(roll)*tan(pitch);
                 0.0 cos(roll)           -sin(roll);
                 0.0 sin(roll)*sec(pitch) cos(roll)*sec(pitch) ] * w;
        dw   = P.J \ (u - skew(w) * P.J * w);
        
        dx = [ deul; dw ];
        
    otherwise
        
        error('ATTITUDE_DYNAMICS: Unknown attitude parameterization')
        
end

end


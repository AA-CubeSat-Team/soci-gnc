function [ dq ] = Q_kinematics( t,q,w )
%Q_KINEMATICS Quaternion Kinematics
%
% Q_ode(t,q,w) outputs the RHS of the quaternion based attitude
% kinematics. It assumes that t is the current time, q is the
% unit quaternion (4x1) and w is the angular velocity (3x1).
%
% T.Reynolds -- RAIN Lab

dq = 0.5 * Q_skew(q) * [ w; 0.0 ];

end


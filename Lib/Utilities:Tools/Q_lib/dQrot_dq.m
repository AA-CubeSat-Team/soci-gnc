function [ C_I2B,dCi2b_dq,dCb2i_dq ] = dQrot_dq( q )
%DQROT_DQ
%
% Provides the DCM and derivative of DCM w.r.t the input quaternion q.
% Standing assumption is that q maps INERTIAL to BODY, and therefore the
% DCM does the same.
%
% T. Reynolds -- RAIN LAB

q0 = q(4);
q1 = q(1);
q2 = q(2);
q3 = q(3);

C_I2B = [ q0^2+q1^2-q2^2-q3^2  2*(q0*q3+q1*q2)      2*(q1*q3-q0*q2);
          2*(q1*q2-q0*q3)      q0^2-q1^2+q2^2-q3^2  2*(q0*q1+q2*q3);
          2*(q0*q2+q1*q3)      2*(q2*q3-q0*q1)      q0^2-q1^2-q2^2+q3^2 ];
  
dCi2b_dq = zeros(3,4,3); % tensor    

% Deriv of first COL by each quat entry    
dCi2b_dq(:,:,1) = 2*[ q1 -q2 -q3  q0;
                      q2  q1 -q0 -q3;
                      q3 -q0  q1 -q2 ];
% Deriv of second COL by each quat entry
dCi2b_dq(:,:,2) = 2*[ q2 q1  q0  q3;
                     -q1 q2 -q3  q0;
                     -q0 q3  q2 -q1 ];
% Deriv of third COL by each quat entry
dCi2b_dq(:,:,3) = 2*[ q3 -q0 q1 -q2;
                      q0  q3 q2  q1;
                     -q1 -q2 q3  q0 ];
               
dCb2i_dq = zeros(3,4,3); % tensor   

% Deriv of first COL by each quat entry    
dCb2i_dq(:,:,1) = 2*[ q1 -q2 -q3  q0;
                      q2  q1  q0  q3;
                      q3 -q0  q1 -q2 ];
% Deriv of second COL by each quat entry
dCb2i_dq(:,:,2) = 2*[ q2 q1 -q0 -q3;
                     -q1 q2 -q3  q0;
                      q0 q3  q2  q1 ];
% Deriv of third COL by each quat entry
dCb2i_dq(:,:,3) = 2*[ q3  q0 q1  q2;
                     -q0  q3 q2 -q1;
                     -q1 -q2 q3  q0 ];

end


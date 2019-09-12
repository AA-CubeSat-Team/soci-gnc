function [ dCi2b_dq,dCb2i_dq ] = dC_dq( q )
%DC_dq
%
% Provides the derivative of DCM w.r.t the input quaternion q.
% Standing assumption is that q maps INERTIAL to BODY, and therefore the
% DCM does the same. This function provides a 3x3x4 tensor that assumes we
% take a derivative of the DCM w.r.t each quaternion entry.
%
% T. Reynolds -- RAIN LAB


dCi2b_dq = zeros(3,3,4);
% First entry
dCi2b_dq(:,:,1) = 2 * [ q(1)  q(2)  q(3);
                        q(2) -q(1)  q(4);
                        q(3) -q(4) -q(1) ];
% Second entry                    
dCi2b_dq(:,:,2) = 2 * [ -q(2) q(1) -q(4);
                         q(1) q(2)  q(3);
                         q(4) q(3) -q(2) ];
% Third entry
dCi2b_dq(:,:,3) = 2 * [ -q(3)  q(4)  q(1);
                        -q(4) -q(3)  q(2);
                         q(1)  q(2)  q(3) ];
% Scalar entry
dCi2b_dq(:,:,4) = 2 * [  q(4)  q(3) -q(2);
                        -q(3)  q(4)  q(1);
                         q(2) -q(1)  q(4) ];
                     
dCb2i_dq = zeros(3,3,4);                     
% First entry
dCb2i_dq(:,:,1) = 2 * [ q(1)  q(2)  q(3);
                        q(2) -q(1) -q(4);
                        q(3)  q(4) -q(1) ];
% Second entry
dCb2i_dq(:,:,2) = 2 * [ -q(2) q(1)  q(4);
                         q(1) q(2)  q(3);
                        -q(4) q(3) -q(2) ];
% Third entry
dCb2i_dq(:,:,3) = 2 * [ -q(3) -q(4) q(1);
                         q(4) -q(3) q(2);
                         q(1)  q(2) q(3) ];
% Scalar entry
dCb2i_dq(:,:,4) = 2 * [ q(4) -q(3)  q(2);
                        q(3)  q(4) -q(1);
                       -q(2)  q(1)  q(4) ];

end


%Author Kate Williams
%Date 1/17/19
%Function conversion of quaternions to rotation matrix R
%input quaternion q0 q1 q2 q3 where q0 is the real component and q1,q2,q3
%is the vector to represent imaginary components
%Assumes the square root of the sum of the squares of q0 q1 q2 q3 is 1

function [R]=quaterniontorotation(q0,q1,q2,q3)
    R=zeros(3);
    R(1,1)=1-2*q2^2-2*q3^2; %column 1 row 1 of rotation matrix
    R(1,2)=2*q1*q2+2*q3*q0; %column 1 row 2...
    R(1,3)=2*q1*q3-2*q2*q0;
    R(2,1)=2*q1*q2-2*q3*q0;
    R(2,2)=1-2*q1^2-2*q3^2;
    R(2,3)=2*q2*q3+2*q1*q0;
    R(3,1)=2*q1*q3+2*q2*q0;
    R(3,2)=2*q2*q3-2*q1*q0;
    R(3,3)=1-2*q1^2-2*q2^2;
end

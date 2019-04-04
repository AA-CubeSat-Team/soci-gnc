%Author Kate Williams
%Date 1/17/19
%Function conversion of rotation matrix to quaternions 
%input rotation matrix R is a 3x3 matrix

function [q0,q1,q2,q3]=rotationtoquaternion(R)
    q0=sqrt(1+R(1,1)+R(2,2)+R(3,3))/2; %real component
    q1=(R(3,2)-R(2,3))/(4*q0);%vector component x on imaginary axis
    q2=(R(1,3)-R(3,1))/(4*q0);%vector component y on imaginary axis
    q3=(R(2,1)-R(1,2))/(4*q0);%vector component y on imaginary axis
end

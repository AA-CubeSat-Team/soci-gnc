
function [P_sq,del_x] = potter(S,H,R,ytilde,yhat)
% This block supports the Embedded MATLAB subset.
% See the help menu for details.
numMeas = size(R,1);
for i=1:numMeas
 Htemp = H(i,:);
 Rtemp = R(i,i);
 ytildetemp=ytilde(i);
 a = S'*Htemp';
 b=1/(a'*a+Rtemp);
 gamma = 1/(1+sqrt(b*Rtemp));
 K = b*S*a
 xnew=K*(ytildetemp-yhat(i));
 Snew=S-gamma*K*a';
% Kj(:,i) = Ki;
 x=xnew
 S=Snew;
end
%output answer
% xPotter=x;
del_x = x;
P_sq=S;
% K = Kj
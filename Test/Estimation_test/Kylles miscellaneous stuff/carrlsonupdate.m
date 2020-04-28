function [del_x, P_sq] = carrlsonupdate(S,H,R,ytilde,yhat)
% This block supports the Embedded MATLAB subset.
% See the help menu for details.
numMeas = size(R,1);
n=max(size(S)); %get size of S matrix
Snew = NaN(size(S));
e=zeros(n,1);
d=R(1,1);
% xnew = del_x;
for j=1:numMeas
 Htemp=H(j,:);
 Rtemp=R(j,j);
 ytildetemp=ytilde(j);

 %Initialize d0,e0 and a
 d0=Rtemp;
 e0=zeros(n,1);
 a=S'*Htemp';
 %%%
 for i=n:-1:1 %1:n %go backwards to maintain lower triangular nature of
%S matrix
 d=d0+a(i)^2;
 b=sqrt(d0/d);
 c=a(i)/sqrt(d0*d);
 e=e0+S(:,i)*a(i);
 Snew(:,i)=S(:,i)*b-e0*c;
 d0=d;
 e0=e;
 end
 xnew=e*((ytildetemp-yhat(j))/d);

%  x=xnew;
 S=Snew;
end
del_x = xnew;
P_sq = Snew;
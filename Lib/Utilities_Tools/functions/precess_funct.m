%Author-Ivan Machuca
%Date - 1/31/19

%This function inputs ttt and outputs the precession angles and precession
%transformation matrix. 

function [prec,psia,wa,ea,xa,zeta,theta,z] = precess_funct(ttt)
%ttt is the julian century in teresterial time 
ttt2=ttt.^2; 
ttt3=ttt.^3;
deg_rad=pi/(180.0*3600); %changing degrees to radians Not sure why multiplying by 3600

%Calculting the iau 76 precession angles in radians
 psia = deg_rad*(5038.7784*ttt - 1.07259*ttt2 - 0.001147*ttt3); 
 wa   = deg_rad*(84381.448+ 0.05127*ttt2 - 0.007726*ttt3);
 ea   = deg_rad*(84381.448 -46.8150*ttt - 0.00059*ttt2 + 0.001813*ttt3);
 xa   = deg_rad*(10.5526*ttt - 2.38064*ttt2 - 0.001125*ttt3);
 
 
 
 zeta = deg_rad*(2306.2181*ttt + 0.30188*ttt2 + 0.017998*ttt3);
 theta= deg_rad*(2004.3109*ttt - 0.42665*ttt2 - 0.041833*ttt3);
 z    = deg_rad*(2306.2181*ttt + 1.09468*ttt2 + 0.018203*ttt3);

%Getting the angles 
coszeta  = cos(zeta);
sinzeta  = sin(zeta);
costheta = cos(theta);
sintheta = sin(theta);
cosz     = cos(z);
sinz     = sin(z);

%Calculating the precession rotation matrix for transformation
 prec(1,1) =  coszeta * costheta * cosz - sinzeta * sinz;
 prec(1,2) =  coszeta * costheta * sinz + sinzeta * cosz;
 prec(1,3) =  coszeta * sintheta;
 prec(2,1) = -sinzeta * costheta * cosz - coszeta * sinz;
 prec(2,2) = -sinzeta * costheta * sinz + coszeta * cosz;
 prec(2,3) = -sinzeta * sintheta;
 prec(3,1) = -sintheta * cosz;
 prec(3,2) = -sintheta * sinz;
 prec(3,3) =  costheta;
 
 

end
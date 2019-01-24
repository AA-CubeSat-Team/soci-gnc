%Author-Ivan Machuca
%Date - 1/24/19

%This function inputs ttt and outputs the precession angles and precession
%transformation matrix. 

function [prec,zeta,theta,z] = precess_funct(ttt)
%ttt is the julian century in teresterial time 
ttt2=ttt^2; 
ttt3=ttt^3;
deg_rad=pi/(180.0*3600.0); %changing degrees to radians 

%Calculting the precession angles 
oblo =  84381.406; %obliquity value at the J2000 epoch
psia =  deg_rad*(((( -0.0000000951 * ttt + 0.000132851 ) * ttt - 0.00114045 ) * ttt - 1.0790069 ) * ttt + 5038.481507 ) * ttt; % cannonical precession angle (rad) 
wa   =  deg_rad*((((  0.0000003337 * ttt - 0.000000467 ) * ttt - 0.00772503 ) * ttt + 0.0512623 ) * ttt -    0.025754 ) * ttt + oblo;% cannonical precession angle (rad) 
ea   =  deg_rad*(((( -0.0000000434 * ttt - 0.000000576 ) * ttt + 0.00200340 ) * ttt - 0.0001831 ) * ttt -   46.836769 ) * ttt + oblo;% cannonical precession angle (rad)
xa   =  deg_rad*(((( - 0.0000000560 * ttt + 0.000170663 ) * ttt - 0.00121197 ) * ttt - 2.3814292 ) * ttt +   10.556403 ) * ttt;% cannonical precession angle (rad)

zeta =  deg_rad*(((( - 0.0000003173 * ttt - 0.000005971 ) * ttt + 0.01801828 ) * ttt + 0.2988499 ) * ttt + 2306.083227 ) * ttt + 2.650545;% precession angle (rad)
theta=  deg_rad*(((( - 0.0000001274 * ttt - 0.000007089 ) * ttt - 0.04182264 ) * ttt - 0.4294934 ) * ttt + 2004.191903 ) * ttt;% precession angle (rad)
z    =  deg_rad*((((   0.0000002904 * ttt - 0.000028596 ) * ttt + 0.01826837 ) * ttt + 1.0927348 ) * ttt + 2306.077181 ) * ttt - 2.650545;% precession angle (rad)

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
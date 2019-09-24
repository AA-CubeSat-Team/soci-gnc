% AA528 HW2
%
% Problem 3
clear variables; close all

% load constants
constants;

cD  = 1;
A   = 2;
rho = 1e-9;
D   = 0.5 * cD * A * rho;

r_p     = 500e3 + rE;
r_a     = 40000e3 + rE;
r_a_f   = r_a - 1e3; % 1km reduction in apogee radius

v_p     = v_at_perigee(muE,r_p,r_a);
v_p_f   = v_at_perigee(muE,r_p,r_a_f);
dv_tot  = v_p - v_p_f;

dv      = 0.0;
r_a_new = r_a;
N_orbit = 0;

while ( dv < dv_tot )
   
    v_p_new = v_at_perigee(muE,r_p,r_a_new);
    dv_new  = D * v_p_new^2;
    r_a_new = 1/(1/r_p - ( v_p_new - dv_new )^2 / (2*muE)) - r_p;
    
    dv      = dv + dv_new;
    N_orbit = N_orbit + 1;
    
end

diff = (r_a - r_a_new) * M2KM;

function vp = v_at_perigee(mu,r_p,r_a)

    vp = sqrt(2*mu*(1/r_p - 1/(r_a+r_p)));

end

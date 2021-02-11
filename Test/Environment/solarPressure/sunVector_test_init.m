clc; clear r_sun error
utc_test = 197208000;

JD_ut1 = 0.062491444204829;

r = [0.9771945;0.1924424;0.0834308];

sim('sunVector_test.slx')

r_sun = [r_sun.Data(1);r_sun.Data(2);r_sun.Data(3)];

r_nrm = r./norm(r);
r_sun_nrm = r_sun./norm(r_sun);
error = rad2deg(acos(dot(r_sun_nrm,r_nrm)));

fprintf('Error in degrees: %5.2e\n',error)



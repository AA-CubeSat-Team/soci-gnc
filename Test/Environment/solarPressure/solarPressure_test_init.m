clc

utc_test = 137803367

r = [3829.45; -888.41; 5459.13] ;

v = [0;0;0];

q = q0;

w = [0;0;0];

state = [r;v;q;w];

sim('solarPressure_test.slx')


solarTorque = solarTorque.Data

ECLIPSE.data
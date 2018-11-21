% Quaternion Test
% addpath('/soci-gnc/Q_lib')

% path

qt = rand(4,1);
q = qt/norm(qt);

rt = rand(4,1);
r = qt/norm(qt);

qn = [q(2),q(3),q(4), q(1)]

rn = [r(2),r(3),r(4), r(1)] 

qxrn = Q_mult(qn,rn)

qxr = [qxrn(4), qxrn(1), qxrn(2),  qxrn(3) ]

sim('Quat_multTest.slx')

simout(1,1:4)
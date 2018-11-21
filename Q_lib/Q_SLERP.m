function qt = Q_SLERP( q0,q1,tspan )

% Uses SLERP to interpolate between two quaternions

if length(q0)~=4 || length(q1)~=4
   if length(q0) == 3 && length(q1) == 3
       q0   = reshape(q0,3,1);
       q1   = reshape(q1,3,1);
       q0   = [q0; 0];
       q1   = [q1; 0];
   else
       error('One of the input vectors is not a quaternion')
   end
end

% Reshape inputs to be column vectors
q0  = reshape(q0, 4, 1);
q1  = reshape(q1, 4 ,1);
len     = length(tspan);

% Change tspan to make sure it is [ 0 , 1 ]
if tspan(1) ~= 0
    tspan   = tspan - tspan(1);
end

if tspan(end) ~= 1
    tspan   = tspan/tspan(end);
end

% Find angle between inputs
ang     = acos(dot(q0,q1));
if ang > pi
    error('SLERP does not apply: angle too large')
end

sang    = sin(ang);
qt      = zeros(4,len);
for i = 1:len
    t       = tspan(i);
    qt(:,i) = (sin((1 - t)*ang)/sang)*q0 + (sin(t*ang)/sang)*q1;
end

end


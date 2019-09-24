function [ g ] = gravity( planet,type,rI )
%GRAVITY
%
% Inputs:  - planet (a string)
%          - type (a string) indicating the gravity model
%          - rI; the inertial position relative the the planet's center
%
% Ouputs: - g; the inertial gravity vector
%
% T. Reynolds

% load constants
constants;

rdir = rI./norm(rI);
rr   = dot(rI,rI);

% planetary parameters
switch planet  
    case 'earth'
        mu = muE;
    case 'moon'
        mu = muMo;
    case 'mars'
        mu = muM;
    otherwise
        error('GRAVITY: Unsupported planet')
end

% compute gravity
g = -(mu/rr)*rdir;

end


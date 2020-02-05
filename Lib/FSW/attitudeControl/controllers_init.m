%Initialize the controllers

% stabilization mode controller -- first one uses MTQ, second one
% uses RWA.
% bdotController_init;
Detumbling_init;

% (point-to-point) reorientation controller
SlewAndControlConstrained_init;

% tracking controller
pdController_init;

% desaturation controller. MTQ desats RWA
Desaturation_init;
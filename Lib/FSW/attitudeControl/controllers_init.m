%Initialize the controllers

% detumble controller
bdotController_init;

% (point-to-point) reorientation controller
SlewAndControlConstrained_init;

% tracking controller
pdController_init;




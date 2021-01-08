% TRIAD Estimator Error Analysis
%
% Determines the threshold at which vectors are "too parallel" to make
% TRIAD a useful algorithm. 
mdl = 'triad_estimator_error_test';

% generate random axis/angle pairs
axis = randn(3,1);
axis = axis./norm(axis);
angl = logspace(-9,-6,100);    % [rad]

% generate a random DCM
eul = -pi + 2*pi * rand(3,1);
dcm_true = rot(eul(1),'x') * rot(eul(2),'y') * rot(eul(3),'z');

% primary inertial vector
vec_eci_1 = randn(3,1);
vec_eci_1 = vec_eci_1./norm(vec_eci_1);

% primary body vector
vec_body_1 = dcm_true * vec_eci_1;

ERR = zeros(size(angl));
fprintf('Running tests: ')
for k = 1:numel(angl)
    txt = fprintf('%d / %d',k,numel(angl));
    % compute the rotation between ECI 1 and 2
    quat = [ cos(angl(k)/2); sin(angl(k)/2).*axis ];
    rotk = quat2dcm( quat' );
    
    % compute secondary vectors
    vec_eci_2 = rotk * vec_eci_1;
    vec_body_2 = dcm_true * vec_eci_2;
    
    % call the TRIAD library
    sim(mdl,0.1)
    
    % save the errors
    ERR(k) = err_deg;
    fprintf(repmat('\b',1,txt));
end
fprintf('done.\n')

figure(1), clf, hold on, grid on, box on
plot(rad2deg(angl),ERR,'k-*','LineWidth',1)
set(gca,'XScale','log','YScale','log')
xlabel('Angle between $v_1$ and $v_2$ [deg]','FontSize',15,'Interpreter','latex')
ylabel('TRIAD error [deg]','FontSize',15,'Interpreter','latex')
% fail a wheel
id_failed = 4;

% parameters for the sim
rwa_valid = [ true; true; true; true ];
rwa_valid(id_failed) = false;            
A_failed = fswParams.allocator.rwa.A;
A_failed(:,id_failed) = zeros(3,1);
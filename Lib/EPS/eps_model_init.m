function simParams = eps_model_init(simParams,fswParams)
%EPS_MODEL_INIT
%
%   Initialize all of the simulation parameters used by the EPS power
%   model.
%
% G. Giddings & Z. Daniel

%% TO EPS %%
% Please pull any spacecraft constants that you can from simParams
%   and fswParams. You'll find most physical spacecraft constants in there,
%   as well as a lot of environmental parameters and unit conversions.
%   
%   Any parameter that you use in your EPS model should be defined here!!
%   Think of this as the "single source of truth" for the data that defines
%   how much power margin we're going to see when running a sim. 
%
% Use the following syntax to define your stuff:
% 
% eps = struct;
% eps.parameter_name_1 = parameter_value_1
% eps.parameter_name_2 = simParams.<sub>.parameter_value_2
%
% simParams.eps = eps;

end


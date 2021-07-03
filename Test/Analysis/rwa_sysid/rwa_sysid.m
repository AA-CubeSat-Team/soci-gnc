clear; close all

exp_name = {'rwa_sysid_20Hz_300To350_step', ...
            'rwa_sysid_20Hz_500To550_step', ...
            'rwa_sysid_20Hz_1000To1050_step', ...
            'rwa_sysid_20Hz_1500To1550_step', ...
            'rwa_sysid_20Hz_2000To2050_step', ...
            'rwa_sysid_20Hz_3000To3050_step', ...
            'rwa_sysid_20Hz_4000To4050_step', ...
            'rwa_sysid_20Hz_5000To5050_step', ...
            'rwa_sysid_20Hz_6000To6050_step'};

for k = 1:numel(exp_name)

    load(strcat(exp_name{k}, '.mat'),'data');

    t       = data.time_ms; 
    input   = data.input_rpm;  
    output  = data.output_rpm;  

    % recenter the data
    base_value_rpm   = min(output);
    input = input - base_value_rpm;
    output = output - base_value_rpm;

    % normalize the data
    scale_factor_rpm = max(input);
    input   = input ./ scale_factor_rpm;
    output  = output ./ scale_factor_rpm;

    % pad with zeros at the beginning
    Nzero = 10;
    input  = [ zeros(Nzero,1); input ];
    output = [ zeros(Nzero,1); output ];

    Ts = round(mean(diff(t))) * 1e-3;

    sid_data = iddata(output, input, Ts);
    sid_data.TimeUnit = 'seconds';
    sid_data.ExperimentName = exp_name{k};

    sid_mdl = tfest(sid_data, 3, 1, 2, 'Ts', Ts);
    
    figure(1)
    compare(sid_data, sid_mdl);

    figure(2), hold on
    h = bodeplot(sid_mdl);
    opt = getoptions(h);
    opt.PhaseMatching = 'on';
    opt.ConfidenceRegionNumberSD = 3;
    opt.PhaseMatching = 'on';
    setoptions(h,opt);
    showConfidence(h);
    
    % pause here to make sure the fit is good
%     keyboard;

    % convert to state space model
    num = sid_mdl.Numerator;
    den = sid_mdl.Denominator;
    % make sure they have equal lengths for discrete systems
    [num, den] = eqtflength(num, den);
    % convert to LTI model
    [A,B,C,D]  = tf2ss(num, den);
    
    rwa_mdl(k).test_name = exp_name{k};
    rwa_mdl(k).base_rpm = base_value_rpm;
    rwa_mdl(k).scale_rpm = scale_factor_rpm;
    rwa_mdl(k).sample_time_s = Ts;
    rwa_mdl(k).iodelay = sid_mdl.IODelay;
    rwa_mdl(k).A = A;
    rwa_mdl(k).B = B;
    rwa_mdl(k).C = C;
    rwa_mdl(k).D = D;
end

save('../Include/rwa_sysid_mdl.mat', 'rwa_mdl')

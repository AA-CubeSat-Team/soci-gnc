function sim_config_display(fswParams, simParams)

fprintf('SOC-i GNC Simulation\n');
fprintf('=============================================================\n');
fprintf('  Config Settings:\n');
fprintf('\tConfigured for flatsat:            %s\n', bool_to_tf_string(simParams.opts.configure_for_flatsat));
fprintf('\tSolar pressure (on/off):           %s\n', bool_to_onoff_string(simParams.opts.SP_ON));
fprintf('\tGravity gradients (on/off):        %s\n', bool_to_onoff_string(simParams.opts.GG_ON));
fprintf('\tAtmospheric disturbances (on/off): %s\n', bool_to_onoff_string(simParams.opts.ATMO_ON));
fprintf('\tSensor noise (on/off):             %s\n', bool_to_onoff_string(simParams.opts.sensor_noise));
fprintf('\tActuator models (on/off):          %s\n', bool_to_onoff_string(simParams.opts.actuator_model));
fprintf('\n');
fprintf('  TLE:\n');
fprintf('\tFilename: %s\n', simParams.opts.tle_filename);
fprintf('\n');
fprintf('  Sample Times (s | Hz)\n');
fprintf('\tSimulation:      %5.4f | %03d\n', simParams.sample_time_s, 1 / simParams.sample_time_s);
fprintf('\tFlight Software: %5.4f | %03d\n', fswParams.sample_time_s, 1 / fswParams.sample_time_s);
fprintf('\n');

end

function [bool_str] = bool_to_tf_string(bool)
    if (bool)
        bool_str = 'true';
    else
        bool_str = 'false';
    end
end

function [bool_str] = bool_to_onoff_string(bool)
    if (bool)
        bool_str = 'on';
    else
        bool_str = 'off';
    end
end
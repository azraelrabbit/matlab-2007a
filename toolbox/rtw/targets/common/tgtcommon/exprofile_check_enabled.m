function exprofile_check_enabled(model)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    try
        % 11 12
        exprofile_enabled = get_param(model, 'ExecutionProfilingEnabled');
    catch
        % 14 16
        % 15 16
        error_STF = 'The operation of the execution profiling block requires that the current System Target File has support for execution profiling. If you wish to use the execution profiling block in your model you should select an appropriate System Target File, for example mpc555rt.tlc or c166.tlc. You can select the System Target File from the Real-Time Workshop panel of the configuration parameters. If you do not wish to use the execution profiling in you should remove the execution profiling block from your model to prevent this error.';
        % 17 25
        % 18 25
        % 19 25
        % 20 25
        % 21 25
        % 22 25
        % 23 25
        % 24 25
        error(error_STF);
        % 26 27
    end % try
    % 28 29
    if strcmp(exprofile_enabled, 'off')
        % 30 31
        error_not_enabled = 'The operation of the execution profiling block requires that execution profiling is enabled. You can enable execution profiling by checking the box in the target specific panel of the configuration parameters in your model. If you do not want to enable execution profiling, you should remove the execution profiling block from your model to prevent this error.';
        % 32 38
        % 33 38
        % 34 38
        % 35 38
        % 36 38
        % 37 38
        error(error_not_enabled);
        % 39 40
    end % if
end % function

function v = validate(this, hC)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    v.Status = 0.0;
    v.Message = '';
    v.MessageID = '';
    % 11 12
    bfp = hC.SimulinkHandle;
    % 13 15
    % 14 15
    if strcmp(get_param(bfp, 'dly_unit'), 'Frames')
        v.Status = 1.0;
        v.Message = 'Frame delays are not yet supported on SP delay block for HDL code generation';
        v.MessageID = 'DSPDelayHDLEmission:validate';
        return;
    end % if
    if strcmp(not(get_param(bfp, 'reset_popup')), 'None')
        v.Status = 1.0;
        v.Messge = 'Control port (reset) is not yet supported on SP delay block for HDL code generation';
        v.MessageID = 'DSPDelayHDLEmission:validate';
    end % if
end % function

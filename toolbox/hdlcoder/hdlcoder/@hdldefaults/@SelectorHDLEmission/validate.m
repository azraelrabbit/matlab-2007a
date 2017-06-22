function v = validate(this, hC)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    status = 0.0;
    msg = '';
    % 10 11
    bfp = hC.SimulinkHandle;
    % 12 14
    % 13 14
    if strcmp(get_param(bfp, 'InputType'), 'Matrix')
        status = 1.0;
        msg = 'Matrices are not supported on selector block for HDL code generation.';
    end % if
    % 18 19
    v.Status = status;
    v.Message = msg;
    v.MessageID = 'SelectorHDLEmission:validate';
end % function

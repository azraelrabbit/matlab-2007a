function v = validate(this, hC)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    v.Status = 0.0;
    v.Message = '';
    v.MessageID = 'SumCascadeHDLEmission:validate';
    % 12 14
    % 13 14
    bfp = hC.SimulinkHandle;
    % 15 16
    inputsigns = get_param(bfp, 'Inputs');
    inputsigns = strrep(inputsigns, '|', '');
    % 18 19
    if not(strcmp(inputsigns(1.0), '+')) && not(strcmp(inputsigns(1.0), '-'))
        % 20 21
        nval = str2double(inputsigns);
        inputsigns = repmat('+', 1.0, nval);
    end % if
    % 24 25
    if gt(length(inputsigns), 1.0)
        v.Status = 1.0;
        v.Message = 'Sum block with cascade implementation requires a single vector as input.';
    end % if
end % function

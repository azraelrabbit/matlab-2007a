function v = validate(this, hC)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    status = 0.0;
    msg = 'Good';
    % 9 11
    bfp = hC.SimulinkHandle;
    % 11 13
    phan = get_param(bfp, 'PortHandles');
    % 13 15
    inputsigns = get_param(bfp, 'Inputs');
    inputsigns = strrep(inputsigns, '|', '');
    % 16 18
    if not(strcmp(inputsigns(1.0), '+')) && not(strcmp(inputsigns(1.0), '-'))
        % 18 20
        nval = str2double(inputsigns);
        inputsigns = repmat('+', 1.0, nval);
    end
    % 22 24
    inputs = this.expandVectorInputs(hC);
    % 24 26
    if eq(size(inputs, 2.0), 1.0) && gt(size(inputs, 1.0), 2.0) && not(all(eq(inputsigns, '+')))
        status = 1.0;
        msg = 'Sum block with more than two inputs of different signs is not supported.';
    else
        if ne(size(inputs, 1.0), 2.0) && not(all(eq(inputsigns, '+')))
            status = 1.0;
            msg = 'Sum block with more than two inputs of different signs is not supported.';
        end
    end
    v.Status = status;
    v.Message = msg;
    v.MessageID = 'SumLinearHDLEmission:validate';
end

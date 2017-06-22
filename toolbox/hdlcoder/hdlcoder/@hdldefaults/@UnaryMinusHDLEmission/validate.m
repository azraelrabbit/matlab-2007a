function v = validate(this, hC)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    status = 0.0;
    msg = 'Good';
    % 10 11
    inputs = hC.InputPorts;
    outputs = hC.OutputPorts;
    % 13 16
    % 14 16
    % 15 16
    if gt(length(inputs), 1.0) || gt(length(outputs), 1.0)
        status = 1.0;
        msg = 'Internal error: found more than one input or output port';
    end % if
    % 20 21
    v.Status = status;
    v.Message = msg;
    v.MessageID = 'UnaryMinusHDLEmission:validate';
end % function

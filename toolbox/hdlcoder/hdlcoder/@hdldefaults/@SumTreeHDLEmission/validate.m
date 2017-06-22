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
    v.MessageID = 'SumTreeHDLEmission:validate';
    % 12 13
    bfp = hC.SimulinkHandle;
    % 14 15
    in1 = hC.InputPorts(1.0).getSignal;
    in1vect = hdlsignalvector(in1);
    vectorsize = max(in1vect);
    % 18 20
    % 19 20
    if gt(length(hC.InputPorts), 1.0) || lt(vectorsize, 2.0)
        v.Status = 1.0;
        v.Message = 'Sum block with tree implementation requires a single vector as input.';
    end % if
end % function

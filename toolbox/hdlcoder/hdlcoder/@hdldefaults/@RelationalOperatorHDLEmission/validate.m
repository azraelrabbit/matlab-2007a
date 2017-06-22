function v = validate(this, hC)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    v = hdlvalidatestruct;
    % 10 11
    Status = 1.0;
    MessageID = 'RelationalOperatorHDLEmission:validate';
    % 13 14
    if hdlgetparameter('isverilog')
        anyvector = gt(max(hdlsignalvector(hC.InputPorts(1.0).getSignal)), 1.0);
        for ii=2.0:length(hC.InputPorts)
            if gt(max(hdlsignalvector(hC.InputPorts(ii).getSignal)), 1.0)
                anyvector = true;
                break
            end % if
        end % for
        if anyvector
            Message = 'Vector inputs to a Relational Operator block are not supported in Verilog';
            v(plus(end, 1.0)) = hdlvalidatestruct(Status, Message, MessageID);
        end % if
    end % if
end % function

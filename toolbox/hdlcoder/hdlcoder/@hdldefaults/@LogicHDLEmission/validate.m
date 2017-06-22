function v = validate(this, hC)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    v = hdlvalidatestruct;
    % 9 11
    messageID = 'LogicHDLEmission:validate';
    % 11 13
    out = hC.OutputPorts(1.0).getSignal;
    outsltype = hdlsignalsltype(out);
    % 14 16
    if ~(strcmp(outsltype, 'boolean') || strcmp(outsltype, 'ufix1'))
        status = 1.0;
        msg = 'Logic Operator blocks output datatype must be single-bit (boolean or ufix1)';
        v(plus(end, 1.0)) = hdlvalidatestruct(status, msg, messageID);
    end
    % 20 22
    if hdlgetparameter('isverilog')
        firstsltype = hdlsignalsltype(hC.InputPorts(1.0).getSignal);
        allsame = true;
        anyvector = gt(max(hdlsignalvector(hC.InputPorts(1.0).getSignal)), 1.0);
        for ii=2.0:length(hC.InputPorts)
            if not(strcmpi(firstsltype, hdlsignalsltype(hC.InputPorts(ii).getSignal)))
                % 27 29
                allsame = false;
                break
            end
            if gt(max(hdlsignalvector(hC.InputPorts(ii).getSignal)), 1.0)
                anyvector = true;
                break
            end
        end % for
        if not(allsame)
            status = 1.0;
            msg = 'The datatypes of all inputs to a Logic Operator block must the same in Verilog';
            v(plus(end, 1.0)) = hdlvalidatestruct(status, msg, messageID);
        end
        if anyvector
            status = 1.0;
            msg = 'Vector inputs to a Logic Operator block are not supported in Verilog';
            v(plus(end, 1.0)) = hdlvalidatestruct(status, msg, messageID);
        end
    end
end

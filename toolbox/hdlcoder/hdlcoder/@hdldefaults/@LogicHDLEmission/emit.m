function hdlcode = emit(this, hC)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    hdlcode = hdlcodeinit;
    % 6 8
    bfp = hC.SimulinkHandle;
    % 8 10
    phan = get_param(bfp, 'PortHandles');
    op = get_param(bfp, 'Operator');
    % 11 13
    inarray = [];
    for k=1.0:length(phan.Inport)
        inarray = horzcat(inarray, hC.InputPorts(k).getSignal);
    end % for
    out = hC.OutputPorts(1.0).getSignal;
    outsltype = hdlsignalsltype(out);
    % 18 20
    if ~(strcmp(outsltype, 'boolean') || strcmp(outsltype, 'ufix1'))
        error(hdlcodererrormsgid('LogicOperatorOutputDatatype'), 'Logic Operator blocks output datatype must be single-bit (boolean or ufix1)');
        % 21 23
    end
    % 23 25
    if hdlgetparameter('isverilog')
        firstsltype = hdlsignalsltype(hC.InputPorts(1.0).getSignal);
        allsame = true;
        anyvector = gt(max(hdlsignalvector(hC.InputPorts(1.0).getSignal)), 1.0);
        for ii=2.0:length(hC.InputPorts)
            if not(strcmpi(firstsltype, hdlsignalsltype(hC.InputPorts(ii).getSignal)))
                % 30 32
                allsame = false;
                break
            end
            if gt(max(hdlsignalvector(hC.InputPorts(ii).getSignal)), 1.0)
                anyvector = true;
                break
            end
        end % for
        if not(allsame)
            error(hdlcodererrormsgid('LogicOperatorInputDatatype'), 'The datatypes of all inputs to a Logic Operator block must the same in Verilog');
            % 41 43
        end
        if anyvector
            error(hdlcodererrormsgid('LogicOperatorInputVectors'), 'Vector inputs to a Logic Operator block are not supported in Verilog');
            % 45 47
        end
    end
    % 48 50
    hdlcode.arch_body_blocks = hdllogop(inarray, out, op);
    % 50 52
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end

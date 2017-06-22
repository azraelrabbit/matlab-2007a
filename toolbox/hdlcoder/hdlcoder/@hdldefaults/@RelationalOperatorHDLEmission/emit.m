function hdlcode = emit(this, hC)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    hdlcode = hdlcodeinit;
    % 7 8
    bfp = hC.SimulinkHandle;
    % 9 10
    phan = get_param(bfp, 'PortHandles');
    op = hdleqop(get_param(bfp, 'Operator'));
    in1 = hC.InputPorts(1.0).getSignal;
    in2 = hC.InputPorts(2.0).getSignal;
    out = hC.OutputPorts(1.0).getSignal;
    % 15 16
    if hdlgetparameter('isverilog')
        firstsltype = hdlsignalsltype(hC.InputPorts(1.0).getSignal);
        allsame = true;
        anyvector = gt(max(hdlsignalvector(hC.InputPorts(1.0).getSignal)), 1.0);
        for ii=2.0:length(hC.InputPorts)
            if not(strcmpi(firstsltype, hdlsignalsltype(hC.InputPorts(ii).getSignal)))
                % 22 23
                allsame = false;
                break
            end % if
            if gt(max(hdlsignalvector(hC.InputPorts(ii).getSignal)), 1.0)
                anyvector = true;
                break
            end % if
        end % for
        % 31 32
        if anyvector
            error(hdlcodererrormsgid('RelationalOperatorInputDatatype'), 'Vector inputs to a Relational Operator block are not supported in Verilog');
            % 34 35
        end % if
    end % if
    % 37 38
    hdlcode.arch_body_blocks = hdlrelop(in1, in2, out, op);
    % 39 40
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function

function hdlcode = emit(this, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hdlcode = hdlcodeinit;
    % 8 10
    % 9 10
    inputs = hC.InputPorts;
    outputs = hC.OutputPorts;
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    if gt(length(inputs), 1.0) || gt(length(outputs), 1.0)
        error(hdlcodererrormsgid('invalidports'), 'Internal error: found more than one input or output port')
        % 18 19
    end % if
    % 20 21
    in = inputs(1.0).getSignal;
    out = outputs(1.0).getSignal;
    % 23 24
    vector = hdlsignalvector(in);
    cplx = hdlsignalcomplex(in);
    isvector = not(isequal(vector, 0.0));
    % 27 28
    if isvector(1.0)
        inputs = hdlexpandvectorsignal(in);
        outputs = hdlexpandvectorsignal(out);
        veclen = max(vector);
    else
        inputs = in;
        outputs = out;
        veclen = 1.0;
    end % if
    % 37 38
    bfp = hC.SimulinkHandle;
    sat = strcmp(get_param(bfp, 'DoSatur'), 'on');
    tableIdx = 0.0;
    % 41 42
    for k=1.0:veclen
        tableIdx = plus(tableIdx, 1.0);
        [tmpbody, tmpsignal] = hdlunaryminus(inputs(tableIdx), outputs(tableIdx), 'Nearest', sat);
        % 45 46
        hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, tmpbody);
        hdlcode.arch_signals = horzcat(hdlcode.arch_signals, tmpsignal);
        % 48 55
        % 49 55
        % 50 55
        % 51 55
        % 52 55
        % 53 55
        % 54 55
    end % for
    % 56 57
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function

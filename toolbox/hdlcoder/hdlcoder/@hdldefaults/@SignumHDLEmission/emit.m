function hdlcode = emit(this, hC)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hdlcode = hdlcodeinit;
    % 9 11
    % 10 11
    inputs = hC.InputPorts;
    outputs = hC.OutputPorts;
    % 13 14
    bfp = hC.SimulinkHandle;
    % 15 16
    constprefix = horzcat(get_param(bfp, 'Name'), '_input');
    % 17 19
    % 18 19
    in = inputs(1.0).getSignal;
    out = outputs(1.0).getSignal;
    % 21 22
    vector = hdlsignalvector(in);
    isvector = not(isequal(vector, 0.0));
    % 24 25
    if isvector(1.0)
        % 26 27
        inputs = hdlexpandvectorsignal(in);
        outputs = hdlexpandvectorsignal(out);
        veclen = max(vector);
    else
        inputs = in;
        outputs = out;
        veclen = 1.0;
    end % if
    % 35 37
    % 36 37
    insltype = hdlsignalsltype(in);
    [insize, inbp, insigned] = hdlwordsize(insltype);
    % 39 40
    hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, hdlgetparameter('comment_char'), ' Signum function: y = signum(u) \n');
    % 41 44
    % 42 44
    % 43 44
    outsltype = hdlsignalsltype(out);
    outvtype = hdlblockdatatype(outsltype);
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    % 47 49
    % 48 49
    [constname_0, constloc_0] = hdlnewsignal(horzcat(constprefix, '_eq_zero'), 'block', -1.0, 0.0, 0.0, outvtype, outsltype);
    % 50 52
    % 51 52
    hdlcval_0 = hdlconstantvalue(0.0, outsize, outbp, outsigned);
    hdlcode.arch_constants = horzcat(hdlcode.arch_constants, makehdlconstantdecl(constloc_0, hdlcval_0));
    % 54 56
    % 55 56
    [constname_1, constloc_1] = hdlnewsignal(horzcat(constprefix, '_gt_zero'), 'block', -1.0, 0.0, 0.0, outvtype, outsltype);
    % 57 59
    % 58 59
    hdlcval_1 = hdlconstantvalue(1.0, outsize, outbp, outsigned);
    hdlcode.arch_constants = horzcat(hdlcode.arch_constants, makehdlconstantdecl(constloc_1, hdlcval_1));
    % 61 62
    if insigned
        % 63 64
        [constname_neg1, constloc_neg1] = hdlnewsignal(horzcat(constprefix, '_lt_zero'), 'block', -1.0, 0.0, 0.0, outvtype, outsltype);
        % 65 67
        % 66 67
        hdlcval_neg1 = hdlconstantvalue(-1.0, outsize, outbp, outsigned);
        hdlcode.arch_constants = horzcat(hdlcode.arch_constants, makehdlconstantdecl(constloc_neg1, hdlcval_neg1));
        % 69 71
        % 70 71
        for k=1.0:veclen
            hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, hdlmux(horzcat(constloc_neg1, constloc_0, constloc_1), outputs(k), inputs(k), {'<','=','>'}, [0.0 0.0 0.0], 'when-else'));
            % 73 74
        end % for
    else
        for k=1.0:veclen
            hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, hdlmux(horzcat(constloc_0, constloc_1), outputs(k), inputs(k), {'=','>'}, [0.0 0.0], 'when-else'));
            % 78 79
        end % for
    end % if
    % 81 82
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function

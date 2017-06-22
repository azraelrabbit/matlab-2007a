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
    % 12 15
    % 13 15
    % 14 15
    if gt(length(inputs), 1.0) || gt(length(outputs), 1.0)
        error(hdlcodererrormsgid('invalidports'), 'Internal error: found more than one input or output port')
        % 17 18
    end % if
    % 19 20
    bfp = hC.SimulinkHandle;
    % 21 23
    % 22 23
    sat = strcmp(get_param(bfp, 'saturateOnIntegerOverflow'), 'on');
    % 24 25
    in = inputs(1.0).getSignal;
    out = outputs(1.0).getSignal;
    % 27 28
    vector = hdlsignalvector(in);
    % 29 30
    isvector = not(isequal(vector, 0.0));
    % 31 32
    if isvector(1.0)
        % 33 34
        inputs = hdlexpandvectorsignal(in);
        outputs = hdlexpandvectorsignal(out);
        veclen = max(vector);
    else
        inputs = in;
        outputs = out;
        veclen = 1.0;
    end % if
    % 42 46
    % 43 46
    % 44 46
    % 45 46
    sltype = hdlsignalsltype(in);
    vtype = hdlblockdatatype(sltype);
    [insize, inbp, insigned] = hdlwordsize(sltype);
    % 49 50
    hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, hdlgetparameter('comment_char'), ' Abs function: |u| \n');
    % 51 53
    % 52 53
    if insigned
        % 54 55
        for k=1.0:veclen
            [idxname, um_input(k)] = hdlnewsignal(horzcat('um_', in.Name, num2str(k)), 'block', -1.0, 0.0, isvector(1.0), vtype, sltype);
            % 57 58
            hdlcode.arch_signals = horzcat(hdlcode.arch_signals, makehdlsignaldecl(um_input(k)));
        end % for
        % 60 62
        % 61 62
        hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, hdlgetparameter('comment_char'), ' Determine the unary minus of the input \n');
        % 63 64
        hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, hdlgetparameter('comment_char'), ' Saturation on Integer Overflow is turned ', get_param(bfp, 'saturateOnIntegerOverflow'), '\n');
        % 65 69
        % 66 69
        % 67 69
        % 68 69
        for k=1.0:veclen
            [tmpbody, tmpsignal] = hdlunaryminus(inputs(k), um_input(k), 'Nearest', sat);
            % 71 72
            hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, tmpbody);
            hdlcode.arch_signals = horzcat(hdlcode.arch_signals, tmpsignal);
        end % for
        % 75 77
        % 76 77
        bdt = hdlgetparameter('base_data_type');
        % 78 79
        blockname = get_param(bfp, 'Name');
        % 80 81
        for k=1.0:veclen
            % 82 83
            [idxname, negative_input(k)] = hdlnewsignal(horzcat('negative_input', num2str(k)), 'block', -1.0, 0.0, isvector(1.0), bdt, 'boolean');
            % 84 85
            hdlcode.arch_signals = horzcat(hdlcode.arch_signals, makehdlsignaldecl(negative_input(k)));
        end % for
        % 87 89
        % 88 89
        [constname, constloc] = hdlnewsignal(horzcat(blockname, '_constant_zero'), 'block', -1.0, 0.0, 0.0, vtype, sltype);
        % 90 93
        % 91 93
        % 92 93
        hdlcval = hdlconstantvalue(0.0, insize, inbp, insigned);
        hdlcode.arch_constants = horzcat(hdlcode.arch_constants, makehdlconstantdecl(constloc, hdlcval));
        % 95 97
        % 96 97
        hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, hdlgetparameter('comment_char'), ' Compare the input to 0 to see if it is negative \n');
        % 98 99
        for k=1.0:veclen
            hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, hdlrelop(inputs(k), constloc, negative_input(k), '<'));
            % 101 102
        end % for
        % 103 105
        % 104 105
        hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, hdlgetparameter('comment_char'), ' Assign the input or its unary minus to the output based on', ' whether the input is negative or not \n');
        % 106 108
        % 107 108
        for k=1.0:veclen
            hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, hdlmux(horzcat(um_input(k), inputs(k)), outputs(k), negative_input(k), {'='}, 1.0, 'when-else'));
            % 110 111
        end % for
    else
        hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, hdlgetparameter('comment_char'), ' Input to Abs block is unsigned, assigning input to output \n');
        % 114 115
        hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, hdlsignalassignment(in, out));
    end % if
    % 117 118
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function

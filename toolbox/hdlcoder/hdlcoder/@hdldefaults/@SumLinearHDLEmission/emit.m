function hdlcode = emit(this, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hdlcode = hdlcodeinit;
    % 7 9
    bfp = hC.SimulinkHandle;
    % 9 11
    if any(strcmp(fieldnames(get_param(bfp, 'objectparameters')), 'roundingMode'))
        rnd = get_param(bfp, 'roundingMode');
        sat = strcmp(get_param(bfp, 'overflowMode'), 'on');
    else
        sat = strcmp(get_param(bfp, 'DoSatur'), 'on');
        rnd = get_param(bfp, 'RndMeth');
    end % if
    % 17 19
    inputsigns = get_param(bfp, 'Inputs');
    inputsigns = strrep(inputsigns, '|', '');
    % 20 22
    if not(strcmp(inputsigns(1.0), '+')) && not(strcmp(inputsigns(1.0), '-'))
        % 22 24
        nval = str2double(inputsigns);
        inputsigns = repmat('+', 1.0, nval);
    end % if
    % 26 28
    inputs = this.expandVectorInputs(hC);
    % 28 30
    out = hC.OutputPorts(1.0).getSignal;
    % 30 32
    body = '';
    sigs = '';
    % 33 35
    if eq(length(inputs(:)), 1.0)
        [body, sigs] = hdlsumofelements(ctranspose(inputs), out, rnd, sat, 'linear');
    else
        if eq(size(inputs, 2.0), 1.0) && gt(size(inputs, 1.0), 2.0)
            if not(all(eq(inputsigns, '+')))
                error(hdlcodererrormsgid('unsupported'), 'Sum block with more than two inputs of different signs is not supported.')
            end % if
            [body, sigs] = hdlsumofelements(ctranspose(inputs), out, rnd, sat, 'linear');
        else
            outs = hdlexpandvectorsignal(out);
            if eq(size(inputs, 1.0), 2.0)
                for ii=1.0:size(inputs, 2.0)
                    switch inputsigns(1.0:2.0)
                    case '++'
                        [tmpbody, tmpsigs] = hdladd(inputs(1.0, ii), inputs(2.0, ii), outs(ii), rnd, sat);
                    case '+-'
                        [tmpbody, tmpsigs] = hdlsub(inputs(1.0, ii), inputs(2.0, ii), outs(ii), rnd, sat);
                    case '-+'
                        [tmpbody, tmpsigs] = hdlsub(inputs(2.0, ii), inputs(1.0, ii), outs(ii), rnd, sat);
                    case '--'
                        [tmpbody, tmpsigs] = hdlsubsub(inputs(1.0, ii), inputs(2.0, ii), outs(ii), rnd, sat);
                    end % switch
                    body = horzcat(body, tmpbody);
                    sigs = horzcat(sigs, tmpsigs);
                end % for
            else
                if not(all(eq(inputsigns, '+')))
                    error(hdlcodererrormsgid('unsupportedmulti'), 'Sum block with more than two inputs of different signs is not supported.')
                    % 62 64
                end % if
                for ii=1.0:size(inputs, 2.0)
                    [tmpbody, tmpsigs] = hdlsumofelements(ctranspose(inputs(:, ii)), outs(ii), rnd, sat, 'linear');
                    body = horzcat(body, tmpbody);
                    sigs = horzcat(sigs, tmpsigs);
                end % for
            end % if
        end % if
        % 71 73
    end % if
    hdlcode.arch_signals = sigs;
    hdlcode.arch_body_blocks = body;
end % function
function [body, sigs] = local_scalar_addsub(in1, in2, out, rnd, sat, inputsigns)
    % 77 142
    % 78 142
    % 79 142
    % 80 142
    % 81 142
    % 82 142
    % 83 142
    % 84 142
    % 85 142
    % 86 142
    % 87 142
    % 88 142
    % 89 142
    % 90 142
    % 91 142
    % 92 142
    % 93 142
    % 94 142
    % 95 142
    % 96 142
    % 97 142
    % 98 142
    % 99 142
    % 100 142
    % 101 142
    % 102 142
    % 103 142
    % 104 142
    % 105 142
    % 106 142
    % 107 142
    % 108 142
    % 109 142
    % 110 142
    % 111 142
    % 112 142
    % 113 142
    % 114 142
    % 115 142
    % 116 142
    % 117 142
    % 118 142
    % 119 142
    % 120 142
    % 121 142
    % 122 142
    % 123 142
    % 124 142
    % 125 142
    % 126 142
    % 127 142
    % 128 142
    % 129 142
    % 130 142
    % 131 142
    % 132 142
    % 133 142
    % 134 142
    % 135 142
    % 136 142
    % 137 142
    % 138 142
    % 139 142
    % 140 142
    if strcmp(inputsigns, '+')
        [body, sigs] = hdlsumofelements(in1, out, rnd, sat, 'linear');
    else
        if strcmp(inputsigns, '++')
            [body, sigs] = hdladd(in1, in2, out, rnd, sat);
        else
            if strcmp(inputsigns, '+-')
                [body, sigs] = hdlsub(in1, in2, out, rnd, sat);
            else
                if strcmp(inputsigns, '-+')
                    [body, sigs] = hdlsub(in2, in1, out, rnd, sat);
                else
                    if strcmp(inputsigns, '--')
                        [body, sigs] = hdlsubsub(in2, in1, out, rnd, sat);
                    else
                        error(hdlcodererrormsgid('unsupported'), 'Sum block with these inputs (%s) is not supported.', inputsigns);
                    end % if
                end % if
            end % if
        end % if
    end % if
end % function

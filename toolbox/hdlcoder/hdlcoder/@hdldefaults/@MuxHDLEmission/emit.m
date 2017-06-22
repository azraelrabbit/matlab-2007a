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
    phan = get_param(bfp, 'PortHandles');
    % 11 13
    if strcmp(this.Blocks{1.0}, 'built-in/Concatenate') || strcmp(this.Blocks{1.0}, 'built-in/Mux')
        hdlcode.arch_body_blocks = genmux(hC, phan);
    else
        error(hdlcodererrormsgid('unhandledblocktype'), 'hdlmuxblock unhandled block type %s', funcname);
        % 16 18
    end % if
    % 18 20
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function
function hdlbody = genmux(hC, phan)
    % 22 25
    % 23 25
    err_matrixsupport = 'Matrices are not supported on matrix concatentation for HDL code generation.';
    % 25 28
    % 26 28
    out = hC.OutputPorts(1.0).getSignal;
    outname = hdlsignalname(out);
    outvec = hdlsignalvector(out);
    % 30 32
    numInputs = length(phan.Inport);
    for k=1.0:numInputs
        % 33 35
        in{k} = hC.InputPorts(k).getSignal;
        vec{k} = hdlsignalvector(in{k});
        if eq(vec{k}, 0.0)
            vec{k} = 1.0;
        end % if
    end % for
    if gt(outvec(1.0), 1.0) && gt(outvec(2.0), 1.0)
        error(hdlcodererrormsgid('matrixnotsupported'), err_matrixsupport);
    end % if
    % 43 45
    hdlbody = [];
    startidx = 0.0;
    if eq(numInputs, 1.0)
        hdlbody = horzcat(hdlbody, hdlsignalassignment(in{1.0}, out));
    else
        for k=1.0:numInputs
            veclen = max(vec{k});
            endidx = minus(plus(veclen, startidx), 1.0);
            hdlbody = horzcat(hdlbody, hdlsignalassignment(in{k}, out, [], startidx:endidx, horzcat(outname, '_', num2str(k))));
            startidx = plus(startidx, veclen);
        end % for
        hdlbody = horzcat(hdlbody, '\n');
    end % if
end % function
function space = spaces(indent)
    % 59 63
    % 60 63
    % 61 63
    space = mtimes(fix(' '), ones(1.0, indent));
end % function

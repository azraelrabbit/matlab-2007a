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
    if strcmp(get(hC.SimulinkHandle, 'BlockType'), 'Demux')
        hdlcode.arch_body_blocks = gendemux(hC, phan);
    else
        error(hdlcodererrormsgid('unhandledblocktype'), 'hdlmuxblock unhandled block type %s', get(hC.SimulinkHandle, 'BlockType'));
        % 16 18
    end % if
    % 18 20
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function
function hdlbody = gendemux(hC, phan)
    % 22 26
    % 23 26
    % 24 26
    in = hC.InputPorts(1.0).getSignal;
    % 26 28
    numOutputs = length(phan.Outport);
    for k=1.0:numOutputs
        % 29 31
        out{k} = hC.OutputPorts(k).getSignal;
        outvec{k} = hdlsignalvector(out{k});
        if eq(outvec{k}, 0.0)
            outvec{k} = 1.0;
        end % if
    end % for
    hdlbody = [];
    startidx = 0.0;
    for k=1.0:numOutputs
        veclen = max(outvec{k});
        endidx = minus(plus(veclen, startidx), 1.0);
        hdlbody = horzcat(hdlbody, hdlsignalassignment(in, out{k}, startidx:endidx, []));
        startidx = plus(startidx, veclen);
    end % for
    hdlbody = horzcat(hdlbody, '\n');
end % function
function space = spaces(indent)
    % 47 51
    % 48 51
    % 49 51
    space = mtimes(fix(' '), ones(1.0, indent));
end % function

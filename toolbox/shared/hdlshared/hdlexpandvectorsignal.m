function entitysignals = hdlexpandvectorsignal(signal, range, porthandles)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    entitysignals = [];
    % 12 14
    uname = hdlsignalname(signal);
    % 14 16
    isvector = hdlsignalvector(signal);
    complexity = hdlsignalcomplex(signal);
    sltype = hdlsignalsltype(signal);
    rate = hdlsignalrate(signal);
    forward = hdlsignalforward(signal);
    % 20 22
    if not(hdlisbeta2)
        % 22 24
        if hdlgetparameter('isvhdl')
            % 24 26
            if hdlisinportsignal(signal)
                vtype = hdlportdatatype(sltype);
            else
                vtype = hdlblockdatatype(sltype);
            end
        else
            if hdlgetparameter('isverilog')
                vtype = hdlsignalvtype(signal);
            end
        end
    end
    % 36 38
    if eq(isvector, 0.0)
        isvector = [1.0 0.0];
        if hdlgetparameter('debug')
            warning(hdlerrormsgid('nonvectorinput'), 'hdlexpandvectorsignal got a non-vector input %s', uname);
            % 41 43
        end
        entitysignals = signal;
        return
    end
    % 46 48
    if eq(isvector(2.0), 0.0) || eq(isvector(1.0), 1.0) || eq(isvector(2.0), 1.0)
        % 48 50
        if lt(nargin, 3.0)
            porthandles = -1.0;
        end
        if lt(nargin, 2.0)
            range = 0.0:minus(max(isvector), 1.0);
        end
        % 55 57
        if hdlisbeta2
            % 57 60
            % 58 60
            entitysignals = localExpandPirSignal(signal, range, porthandles);
        else
            % 61 64
            % 62 64
            signalTable = hdlgetsignaltable;
            % 64 68
            % 65 68
            % 66 68
            entitysignals = signalTable.expandSignal(range, porthandles, uname, '', complexity, 0.0, vtype, sltype, rate, forward);
            % 68 70
        end
    else
        % 71 73
        error(hdlerrormsgid('matrixunsupported'), 'Matrix data types are not supported at this time!');
        % 73 75
    end
end
function entitysignals = localExpandPirSignal(signal, range, porthandles)
    % 77 80
    % 78 80
    entitysignals = [];
    network = signal.Owner;
    array_deref = hdlgetparameter('array_deref');
    uname = hdlsignalname(signal);
    sltype = hdlsignalsltype(signal);
    vtype = hdlblockdatatype(sltype);
    complexity = hdlsignalcomplex(signal);
    rate = hdlsignalrate(signal);
    dims = 0.0;
    forward = hdlsignalforward(signal);
    % 89 91
    count = 1.0;
    for n=range
        if gt(count, length(porthandles))
            ph = -1.0;
        else
            ph = porthandles(count);
            count = plus(count, 1.0);
        end
        % 98 100
        sigindex = horzcat(array_deref(1.0), num2str(n), array_deref(2.0));
        % 100 105
        % 101 105
        % 102 105
        % 103 105
        if complexity
            % 105 107
            error('HDL Coder does not support complex data types')
        else
            % 108 110
            % 109 116
            % 110 116
            % 111 116
            % 112 116
            % 113 116
            % 114 116
            fakesignal = true;
            % 116 118
            name = horzcat(uname, sigindex);
            newsignal = pirhdlnewsignal(network, name, ph, 0.0, dims, vtype, sltype, rate, forward, fakesignal);
            % 119 123
            % 120 123
            % 121 123
            entitysignals = horzcat(entitysignals, newsignal);
            % 123 125
        end
        % 125 127
    end % for
end

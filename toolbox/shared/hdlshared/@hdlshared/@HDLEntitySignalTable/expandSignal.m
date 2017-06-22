function entitysignals = expandSignal(this, range, porthandles, uname, block, complexity, dims, vtype, sltype, rate, forward)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    hdl_parameters = PersistentHDLPropSet;
    hdl_parameters = hdl_parameters.INI.struct;
    % 17 18
    entitysignals = [];
    % 19 20
    for i=1.0:length(porthandles)
        if eq(porthandles(i), -1.0)
            porthandles(i) = [];
        end % if
    end % for
    % 25 26
    count = 1.0;
    for n=range
        if gt(count, length(porthandles))
            ph = [];
        else
            ph = porthandles(count);
            count = plus(count, 1.0);
        end % if
        % 34 35
        sigindex = horzcat(hdl_parameters.array_deref(1.0), num2str(n), hdl_parameters.array_deref(2.0));
        % 36 40
        % 37 40
        % 38 40
        % 39 40
        if complexity
            % 41 43
            % 42 43
            name = horzcat(uname, sigindex);
            signal = hdlshared.HDLEntitySignal(name, '', ph, complexity, dims, vtype, sltype, rate, forward);
            idx1 = this.addSignal(signal);
            % 46 48
            % 47 48
            pos = findstr(uname, hdl_parameters.complex_real_postfix);
            pos = pos(end);
            uname1 = horzcat(uname(1.0:minus(pos, 1.0)), hdl_parameters.complex_imag_postfix);
            name1 = horzcat(uname1, sigindex);
            signal = hdlshared.HDLEntitySignal(name, '', ph, complexity, dims, vtype, sltype, rate, forward);
            idx2 = this.addSignal(signal);
            % 54 55
            entitysignals = horzcat(entitysignals, idx1, idx2);
        else
            % 57 59
            % 58 59
            name = horzcat(uname, sigindex);
            signal = hdlshared.HDLEntitySignal(name, '', ph, complexity, dims, vtype, sltype, rate, forward);
            idx = this.addSignal(signal);
            % 62 63
            entitysignals = horzcat(entitysignals, idx);
            % 64 65
        end % if
        % 66 67
    end % for
end % function

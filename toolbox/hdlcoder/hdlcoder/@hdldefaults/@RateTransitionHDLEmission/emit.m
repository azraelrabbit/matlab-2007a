function hdlcode = emit(this, hC)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    bfp = hC.SimulinkHandle;
    % 10 12
    % 11 12
    dintegrity_on = strcmpi(get_param(bfp, 'Integrity'), 'on');
    ddtransfer_on = strcmpi(get_param(bfp, 'deterministic'), 'on');
    % 14 15
    if not(dintegrity_on) || not(ddtransfer_on)
        % 16 17
        Message = 'Rate Transition block is supported only if both Data Integrity and Deterministic Data Transfer are ensured.';
        % 18 19
        error(hdlcodererrormsgid('unsupported'), Message)
    end % if
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    hdlcode = hdlcodeinit;
    % 26 27
    in = hC.InputPorts(1.0).getSignal;
    out = hC.OutputPorts(1.0).getSignal;
    % 29 30
    ip_samp_time = hdlsignalrate(in);
    op_samp_time = hdlsignalrate(out);
    % 32 33
    if le(ip_samp_time, op_samp_time)
        hdlcode.arch_body_blocks = hdlsignalassignment(in, out);
    else
        % 36 38
        % 37 38
        processName = horzcat(hdllegalname(get_param(bfp, 'Name')), hdlgetparameter('clock_process_label'));
        % 39 42
        % 40 42
        % 41 42
        scalarIC = 0.0;
        rto = get_param(bfp, 'RuntimeObject');
        np = get(rto, 'NumRuntimePrms');
        for n=1.0:np
            if strcmp(rto.RuntimePrm(n).get.Name, 'X0')
                scalarIC = rto.RuntimePrm(n).Data;
            end % if
        end % for
        % 50 54
        % 51 54
        % 52 54
        % 53 54
        context = this.beginClockBundleContext(hC.Owner, hC, in, 1.0, 1.0, 0.0);
        % 55 56
        [body, sigs] = hdlunitdelay(in, out, processName, scalarIC);
        % 57 58
        this.endClockBundleContext(context);
        % 59 60
        hdlcode.arch_signals = horzcat(hdlcode.arch_signals, sigs);
        hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, body);
    end % if
    % 63 64
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function

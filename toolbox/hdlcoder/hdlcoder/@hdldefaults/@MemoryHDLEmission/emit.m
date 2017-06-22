function hdlcode = emit(this, hC)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hdlcode = hdlcodeinit;
    % 10 11
    bfp = hC.SimulinkHandle;
    % 12 13
    in = hC.InputPorts(1.0).getSignal;
    out = hC.OutputPorts(1.0).getSignal;
    % 15 16
    ip_samp_time = hdlsignalrate(in);
    op_samp_time = hdlsignalrate(out);
    % 18 21
    % 19 21
    % 20 21
    inherit_samp_time_on = strcmpi(get_param(bfp, 'InheritSampleTime'), 'on');
    % 22 23
    if not(inherit_samp_time_on) || eq(ip_samp_time, 0.0) || eq(op_samp_time, 0.0)
        % 24 25
        Message = 'Memory block is supported only if Inherit Sample Time property is checked and neither input nor output are continuous.';
        % 26 27
        error(hdlcodererrormsgid('unsupported'), Message)
    end % if
    % 29 30
    processName = hdllegalname(get_param(bfp, 'Name'));
    processName = horzcat(processName, hdlgetparameter('clock_process_label'));
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    scalarIC = 0.0;
    rto = get_param(bfp, 'RuntimeObject');
    np = get(rto, 'NumRuntimePrms');
    for n=1.0:np
        if strcmp(rto.RuntimePrm(n).get.Name, 'X0')
            scalarIC = rto.RuntimePrm(n).Data;
        end % if
    end % for
    % 44 45
    in = hC.InputPorts(1.0).getSignal;
    out = hC.OutputPorts(1.0).getSignal;
    % 47 48
    hS = this.findSignalWithValidRate(hC.Owner, hC, horzcat(hC.InputPorts(1.0).getSignal, hC.OutputPorts(1.0).getSignal));
    % 49 51
    % 50 51
    context = this.beginClockBundleContext(hC.Owner, hC, hS, 1.0, 1.0, 0.0);
    % 52 53
    [body, sigs] = hdlunitdelay(in, out, processName, scalarIC);
    % 54 55
    this.endClockBundleContext(context);
    % 56 57
    hdlcode.arch_signals = sigs;
    hdlcode.arch_body_blocks = body;
    % 59 60
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function

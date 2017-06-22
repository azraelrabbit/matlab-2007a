function hdlcode = emit(this, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hdlcode = hdlcodeinit;
    % 8 9
    bfp = hC.SimulinkHandle;
    % 10 11
    name = hdllegalname(get_param(bfp, 'Name'));
    % 12 13
    processName = hdllegalname(get_param(bfp, 'Name'));
    processName = horzcat(processName, hdlgetparameter('clock_process_label'));
    % 15 16
    body = '';
    signals = '';
    % 18 19
    out = hC.OutputPorts(1.0).getSignal;
    sltype = hdlsignalsltype(out);
    [size, bp, sign] = hdlgetsizesfromtype(sltype);
    vtype = hdlblockdatatype(sltype);
    % 23 24
    uplimit = power(2.0, size);
    % 25 26
    context = this.beginClockBundleContext(hC.Owner, hC, out, 1.0, 1.0, 0.0);
    % 27 28
    [tmpbody, tmpsignals] = hdlcounter(out, uplimit, processName, 1.0, 0.0, -1.0);
    % 29 30
    this.endClockBundleContext(context);
    % 31 32
    body = horzcat(body, tmpbody);
    signals = horzcat(signals, tmpsignals);
    % 34 35
    hdlcode.arch_body_blocks = body;
    hdlcode.arch_signals = signals;
end % function

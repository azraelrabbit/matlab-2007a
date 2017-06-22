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
    processName = hdllegalname(get_param(bfp, 'Name'));
    processName = horzcat(processName, hdlgetparameter('clock_process_label'));
    % 12 14
    uplimit = plus(evalin('base', get_param(bfp, 'uplimit')), 1.0);
    % 14 16
    out = hC.OutputPorts(1.0).getSignal;
    % 16 18
    context = this.beginClockBundleContext(hC.Owner, hC, out, 1.0, 1.0, 0.0);
    % 18 20
    [hdlcode.arch_body_blocks, hdlcode.arch_signals] = hdlcounter(out, uplimit, processName, 1.0, 0.0, -1.0);
    % 20 23
    % 21 23
    this.endClockBundleContext(context);

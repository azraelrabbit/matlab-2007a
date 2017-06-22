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
    % 10 12
    % 11 12
    scalarIC = 0.0;
    rto = get_param(bfp, 'RuntimeObject');
    np = get(rto, 'NumRuntimePrms');
    for n=1.0:np
        if strcmp(rto.RuntimePrm(n).get.Name, 'InitialCondition')
            scalarIC = rto.RuntimePrm(n).Data;
        end % if
    end % for
    % 20 21
    numdelays = evalin('base', get_param(bfp, 'NumDelays'));
    processName = hdllegalname(get_param(bfp, 'Name'));
    processName = horzcat(processName, hdlgetparameter('clock_process_label'));
    % 24 26
    % 25 26
    delayorder = get_param(bfp, 'DelayOrder');
    includecurrent = get_param(bfp, 'includeCurrent');
    % 28 30
    % 29 30
    hS = hC.OutputPorts(1.0).getSignal;
    context = this.beginClockBundleContext(hC.Owner, hC, hS, 1.0, 1.0, 0.0);
    % 32 33
    [body, sigs] = hdltapdelay(hC.InputPorts(1.0).getSignal, hC.OutputPorts(1.0).getSignal, processName, numdelays, delayorder, scalarIC, includecurrent);
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    this.endClockBundleContext(context);
    % 39 40
    hdlcode.arch_signals = sigs;
    hdlcode.arch_body_blocks = body;
    % 42 43
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function

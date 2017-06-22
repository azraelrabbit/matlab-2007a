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
            break
        end % if
    end % for
    % 21 22
    processName = hdllegalname(get_param(bfp, 'Name'));
    processName = horzcat(processName, hdlgetparameter('clock_process_label'));
    % 24 25
    numdelays = evalin('base', get_param(bfp, 'NumDelays'));
    % 26 27
    hS = this.findSignalWithValidRate(hC.Owner, hC, horzcat(hC.OutputPorts(1.0).getSignal, hC.InputPorts(1.0).getSignal));
    % 28 30
    % 29 30
    context = this.beginClockBundleContext(hC.Owner, hC, hS, 1.0, 1.0, 0.0);
    % 31 32
    if eq(numdelays, 1.0)
        [body, sigs] = hdlunitdelay(hC.InputPorts(1.0).getSignal, hC.OutputPorts(1.0).getSignal, processName, scalarIC);
    else
        % 35 36
        % 36 37
        [body, sigs] = hdlintdelay(hC.InputPorts(1.0).getSignal, hC.OutputPorts(1.0).getSignal, processName, numdelays, scalarIC);
        % 38 40
        % 39 40
    end % if
    % 41 42
    this.endClockBundleContext(context);
    % 43 44
    hdlcode.arch_signals = sigs;
    hdlcode.arch_body_blocks = body;
    % 46 47
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function

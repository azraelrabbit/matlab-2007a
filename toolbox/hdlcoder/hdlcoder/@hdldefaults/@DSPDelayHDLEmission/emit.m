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
    if strcmp(get_param(bfp, 'dly_unit'), 'Frames')
        error(hdlcodererrormsgid('framedelayunsupported'), 'Frame delays are not yet supported on SP delay block for HDL code generation');
        % 14 15
    end % if
    if strcmp(not(get_param(bfp, 'reset_popup')), 'None')
        error(hdlcodererrormsgid('controlportunsupported'), 'Control port (reset) is not yet supported on SP delay block for HDL code generation');
        % 18 19
    end % if
    % 20 22
    % 21 22
    scalarIC = 0.0;
    rto = get_param(bfp, 'RuntimeObject');
    np = get(rto, 'NumRuntimePrms');
    for n=1.0:np
        if strcmp(rto.RuntimePrm(n).get.Name, 'IC')
            scalarIC = rto.RuntimePrm(n).Data;
        end % if
    end % for
    numdelays = evalin('base', get_param(bfp, 'delay'));
    processName = hdllegalname(get_param(bfp, 'Name'));
    processName = horzcat(processName, hdlgetparameter('clock_process_label'));
    % 33 34
    hS = this.findSignalWithValidRate(hC.Owner, hC, horzcat(hC.InputPorts(1.0).getSignal, hC.OutputPorts(1.0).getSignal));
    % 35 37
    % 36 37
    context = this.beginClockBundleContext(hC.Owner, hC, hS, 1.0, 1.0, 0.0);
    % 38 41
    % 39 41
    % 40 41
    [body, sigs] = hdlintdelay(hC.InputPorts(1.0).getSignal, hC.OutputPort(1.0).getSignal, processName, numdelays, scalarIC);
    % 42 45
    % 43 45
    % 44 45
    this.endClockBundleContext(context);
    % 46 47
    hdlcode.arch_signals = sigs;
    hdlcode.arch_body_blocks = body;
    % 49 50
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function

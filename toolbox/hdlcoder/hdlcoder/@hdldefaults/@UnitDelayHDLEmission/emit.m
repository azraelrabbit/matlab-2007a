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
    processName = hdllegalname(get_param(bfp, 'Name'));
    processName = horzcat(processName, hdlgetparameter('clock_process_label'));
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    scalarIC = 0.0;
    rto = get_param(bfp, 'RuntimeObject');
    np = get(rto, 'NumRuntimePrms');
    for n=1.0:np
        if strcmp(rto.RuntimePrm(n).get.Name, 'X0')
            scalarIC = rto.RuntimePrm(n).Data;
        end % if
    end % for
    % 25 26
    hSOut = hC.OutputPorts(1.0).getSignal;
    hSIn = hC.InputPorts(1.0).getSignal;
    % 28 29
    invectSize = hdlsignalvector(hSIn);
    outvectSize = hdlsignalvector(hSOut);
    % 31 32
    context = this.beginClockBundleContext(hC.Owner, hC, hSOut, 1.0, 1.0, 0.0);
    % 33 34
    if eq(max(invectSize), max(outvectSize))
        input = hSIn;
        output = hSOut;
    else
        input = repmat(hSIn, 1.0, max(outvectSize));
        hdlregsignal(hSOut);
        output = hdlexpandvectorsignal(hSOut);
    end % if
    % 42 43
    [body, sigs] = hdlunitdelay(input, output, processName, scalarIC);
    % 44 45
    this.endClockBundleContext(context);
    % 46 47
    hdlcode.arch_signals = horzcat(hdlcode.arch_signals, sigs);
    hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, body);
    % 49 50
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function

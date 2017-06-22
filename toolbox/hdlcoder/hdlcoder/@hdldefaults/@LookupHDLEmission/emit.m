function hdlcode = emit(this, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hdlcode = hdlcodeinit;
    % 7 9
    bfp = hC.SimulinkHandle;
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    if any(strcmp(fieldnames(get_param(bfp, 'objectparameters')), 'roundingMode'))
        rnd = get_param(bfp, 'roundingMode');
        sat = strcmp(get_param(bfp, 'overflowMode'), 'on');
    else
        sat = strcmp(get_param(bfp, 'DoSatur'), 'on');
        rnd = get_param(bfp, 'RndMeth');
    end % if
    % 20 24
    % 21 24
    % 22 24
    tablein = evalin('base', get(get_param(bfp, 'Object'), 'InputValues'));
    tableout = evalin('base', get(get_param(bfp, 'Object'), 'OutputValues'));
    % 25 27
    [hdlcode.arch_body_blocks, hdlcode.arch_signals, hdlcode.arch_constants] = hdllookuptable(hC.InputPorts(1.0).getSignal, hC.OutputPorts(1.0).getSignal, tablein, tableout, 'Nearest', 1.0);
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));

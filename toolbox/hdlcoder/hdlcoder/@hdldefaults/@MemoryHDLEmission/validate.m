function v = validate(this, hC)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    v.Status = 0.0;
    v.Message = '';
    v.MessageID = 'MemoryHDLEmission:validate';
    % 12 13
    bfp = hC.SimulinkHandle;
    % 14 15
    in = hC.InputPorts(1.0).getSignal;
    out = hC.OutputPorts(1.0).getSignal;
    % 17 18
    ip_samp_time = hdlsignalrate(in);
    op_samp_time = hdlsignalrate(out);
    % 20 23
    % 21 23
    % 22 23
    inherit_samp_time_on = strcmpi(get_param(bfp, 'InheritSampleTime'), 'on');
    % 24 25
    if not(inherit_samp_time_on) || eq(ip_samp_time, 0.0) || eq(op_samp_time, 0.0)
        % 26 27
        v.Status = 1.0;
        v.Message = 'Memory block is supported only if Inherit Sample Time property is checked and neither input nor output are continuous.';
        % 29 30
    end % if
end % function

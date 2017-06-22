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
    v.MessageID = 'DataTypeConversionHDLEmission:validate';
    % 12 13
    bfp = hC.SimulinkHandle;
    % 14 15
    bfph = get_param(bfp, 'Handle');
    rnd = get_param(bfp, 'RndMeth');
    sat = strcmp(get_param(bfp, 'DoSatur'), 'on');
    % 18 19
    in = hC.InputPorts(1.0).getSignal;
    out = hC.OutputPorts(1.0).getSignal;
    blockname = hdllegalnamersvd(get_param(bfp, 'Name'));
    % 22 23
    convtype = get_param(bfp, 'ConvertRealWorld');
    % 24 25
    isdouble = hdlsignalisdouble(horzcat(in, out));
    if any(eq(isdouble, true)) && any(eq(isdouble, false))
        v.Message = sprintf('Illegal conversion to/from double and fixed-point--operation not possible in %s.', horzcat(get(bfph, 'Path'), '/', get(bfph, 'Name')));
        % 28 29
    end % if
end % function

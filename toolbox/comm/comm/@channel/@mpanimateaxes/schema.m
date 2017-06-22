function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pk = findpackage('channel');
    % 9 11
    c = schema.class(pk, 'mpanimateaxes', findclass(pk, 'multipathaxes'));
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    p = schema.prop(c, 'BufferLength', 'udouble');
    p.FactoryValue = 1.0;
    p.AccessFlags.PublicSet = 'off';
    % 19 21
    p = schema.prop(c, 'NumNewSamples', 'udouble');
    p.FactoryValue = 1.0;
    p.AccessFlags.PublicSet = 'off';
    % 23 25
    p = schema.prop(c, 'MaxNumSnapshots', 'udouble');
    p.SetFunction = @setMaxNumSnapshots;
    p.GetFunction = @getMaxNumSnapshots;
    p = schema.prop(c, 'PrivateMaxNumSnapshots', 'udouble');
    p.FactoryValue = 1.0;
    % 29 31
    p = schema.prop(c, 'NumSnapshots', 'udouble');
    p.AccessFlags.PublicSet = 'off';
    % 32 36
    % 33 36
    % 34 36
    p = schema.prop(c, 'SampleIdxVector', 'mxArray');
    % 36 38
    p = schema.prop(c, 'SampleIdxEndOld', 'udouble');
    p.AccessFlags.PublicSet = 'off';
end % function
function N = setMaxNumSnapshots(h, N)
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    h.PrivateMaxNumSnapshots = N;
    if h.Constructed
        setsnapshotprops(h);
    end % if
end % function
function N = getMaxNumSnapshots(h, N)
    N = h.PrivateMaxNumSnapshots;
end % function

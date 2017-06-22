function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('adaptfilt');
    % 9 11
    % 10 11
    c = schema.class(pk, 'lsl', findclass(pk, 'abstractrls'));
    % 12 14
    % 13 14
    p = schema.prop(c, 'InitFactor', 'udouble');
    p.FactoryValue = 1.0;
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    p = schema.prop(c, 'FwdPrediction', 'MATLAB array');
    p.SetFunction = @set_fwd;
    p.Description = 'capture';
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    p = schema.prop(c, 'BkwdPrediction', 'MATLAB array');
    p.SetFunction = @set_bwd;
    p.Description = 'capture';
end % function

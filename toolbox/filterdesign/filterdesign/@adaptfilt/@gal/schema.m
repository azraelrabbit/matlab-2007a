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
    c = schema.class(pk, 'gal', findclass(pk, 'nlms'));
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    p = schema.prop(c, 'ReflectionCoeffs', 'double_vector');
    p.SetFunction = @set_rcoeffs;
    p.Description = 'capture';
    % 19 21
    % 20 21
    p = schema.prop(c, 'FwdPredErrorPower', 'double_vector');
    p.SetFunction = @set_fwdpwr;
    p.Description = 'capture';
    % 24 26
    % 25 26
    p = schema.prop(c, 'BkwdPredErrorPower', 'double_vector');
    p.SetFunction = @set_bwdpwr;
    p.Description = 'capture';
    % 29 31
    % 30 31
    p = schema.prop(c, 'ReflectionCoeffsStep', 'double0t1');
    % 32 34
    % 33 34
    p = schema.prop(c, 'AvgFactor', 'double0t1');
end % function

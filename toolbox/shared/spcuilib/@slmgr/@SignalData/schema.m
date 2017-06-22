function schema
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    pk = findpackage('slmgr');
    thisclass = schema.class(pk, 'SignalData');
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    schema.prop(thisclass, 'numComponents', 'int');
    schema.prop(thisclass, 'dtype', 'string');
    schema.prop(thisclass, 'dims', 'MATLAB array');
    schema.prop(thisclass, 'period', 'double');
    schema.prop(thisclass, 'rto', 'MATLAB array');
    schema.prop(thisclass, 'portIdx', 'MATLAB array');
    schema.prop(thisclass, 'blkh', 'MATLAB array');
    % 24 26
    % 25 26
    p = schema.prop(thisclass, 'time', 'double');
    p.FactoryValue = -1.0;
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    % 32 33
    schema.prop(thisclass, 'rtoListeners', 'MATLAB array');
    % 34 37
    % 35 37
    % 36 37
    schema.prop(thisclass, 'UserData', 'MATLAB array');
    % 38 41
    % 39 41
    % 40 41
    schema.prop(thisclass, 'TargetObject', 'MATLAB array');
end % function

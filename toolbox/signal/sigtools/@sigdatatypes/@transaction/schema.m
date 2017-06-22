function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigdatatypes');
    hpk = findpackage('handle');
    % 10 12
    % 11 12
    c = schema.class(pk, 'transaction', hpk.findclass('transaction'));
    % 13 14
    p = schema.prop(c, 'PropertyListeners', 'handle vector');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.Serialize = 'off';
    % 18 19
    p = schema.prop(c, 'Object', 'handle');
    p = schema.prop(c, 'Property', 'MATLAB array');
    p = schema.prop(c, 'OldValue', 'MATLAB array');
    p = schema.prop(c, 'NewValue', 'MATLAB array');
end % function

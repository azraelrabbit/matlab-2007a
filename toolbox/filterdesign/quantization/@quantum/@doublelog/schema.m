function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'doublelog', pk.findclass('abstractlog'));
    % 10 11
    p = schema.prop(c, 'MinFxPtRange', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 13 15
    % 14 15
    p = schema.prop(c, 'MaxFxPtRange', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 17 19
    % 18 19
    p = schema.prop(c, 'NOutOfRange', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
end % function

function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'limitcycle');
    c.Handle = 'off';
    % 11 12
    p = schema.prop(c, 'LimitCycle', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 14 16
    % 15 16
    p = schema.prop(c, 'Zi', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 18 20
    % 19 20
    p = schema.prop(c, 'Output', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 22 24
    % 23 24
    p = schema.prop(c, 'Period', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 26 29
    % 27 29
    % 28 29
    p = schema.prop(c, 'Trial', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
end % function

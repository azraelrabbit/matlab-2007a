function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siglayout');
    c = schema.class(pk, 'gridlayout', pk.findclass('abstractlayout'));
    % 10 11
    p = schema.prop(c, 'Grid', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off', 'FactoryValue', []);
    % 13 14
    schema.prop(c, 'HorizontalGap', 'double');
    schema.prop(c, 'VerticalGap', 'double');
    % 16 17
    p = schema.prop(c, 'UpdateListener', 'handle.listener vector');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 19 20
    p = schema.prop(c, 'ChildrenListeners', 'handle.listener vector');
    set(p, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
end % function

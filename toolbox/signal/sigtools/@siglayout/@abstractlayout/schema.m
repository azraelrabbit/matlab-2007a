function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siglayout');
    c = schema.class(pk, 'abstractlayout');
    set(c, 'Description', 'abstract');
    % 11 12
    p = schema.prop(c, 'Panel', 'double');
    set(p, 'SetFunction', @set_panel, 'AccessFlags.PublicSet', 'Off');
    % 14 15
    p = schema.prop(c, 'OldPosition', 'double_vector');
    set(p, 'Visible', 'Off');
    % 17 18
    p = schema.prop(c, 'Invalid', 'bool');
    set(p, 'Visible', 'Off');
    % 20 21
    p = schema.prop(c, 'Panel_Listeners', 'handle.listener vector');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end % function

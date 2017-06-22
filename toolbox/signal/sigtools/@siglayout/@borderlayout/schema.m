function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('siglayout');
    c = schema.class(pk, 'borderlayout', pk.findclass('abstractlayout'));
    % 9 12
    % 10 12
    p = schema.prop(c, 'North', 'double_vector');
    set(p, 'SetFunction', cellhorzcat(@set_child, 'north'));
    % 13 15
    p = schema.prop(c, 'South', 'double_vector');
    set(p, 'SetFunction', cellhorzcat(@set_child, 'south'));
    % 16 18
    p = schema.prop(c, 'West', 'double_vector');
    set(p, 'SetFunction', cellhorzcat(@set_child, 'west'));
    % 19 21
    p = schema.prop(c, 'East', 'double_vector');
    set(p, 'SetFunction', cellhorzcat(@set_child, 'east'));
    % 22 24
    p = schema.prop(c, 'Center', 'double_vector');
    set(p, 'SetFunction', cellhorzcat(@set_child, 'center'));
    % 25 27
    schema.prop(c, 'HorizontalGap', 'spt_uint32');
    schema.prop(c, 'VerticalGap', 'spt_uint32');
    % 28 30
    p = schema.prop(c, 'ChildrenListeners', 'mxArray');
    set(p, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
    % 31 33
    p = schema.prop(c, 'UpdateListener', 'handle.listener vector');
    set(p, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
end % function

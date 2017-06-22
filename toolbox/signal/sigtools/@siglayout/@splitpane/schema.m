function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('siglayout');
    c = schema.class(pk, 'splitpane', pk.findclass('abstractlayout'));
    % 9 11
    p = schema.prop(c, 'NorthWest', 'double_vector');
    set(p, 'SetFunction', cellhorzcat(@set_child, 'northwest'));
    % 12 14
    p = schema.prop(c, 'SouthEast', 'double_vector');
    set(p, 'SetFunction', cellhorzcat(@set_child, 'southeast'));
    % 15 17
    if isempty(findtype('splitpaneDominantType'))
        schema.EnumType('splitpaneDominantType', {'NorthWest','SouthEast'});
    end % if
    % 19 21
    if isempty(findtype('splitpaneLayoutDirectionType'))
        schema.EnumType('splitpaneLayoutDirectionType', {'Horizontal','Vertical'});
    end % if
    % 23 25
    schema.prop(c, 'LayoutDirection', 'splitpaneLayoutDirectionType');
    schema.prop(c, 'Dominant', 'splitpaneDominantType');
    % 26 28
    p = schema.prop(c, 'DominantWidth', 'double');
    set(p, 'FactoryValue', 100.0);
    % 29 31
    p = schema.prop(c, 'DividerWidth', 'double');
    set(p, 'FactoryValue', 5.0);
    % 32 34
    p = schema.prop(c, 'DividerHandle', 'double');
    set(p, 'Visible', 'Off');
    % 35 37
    schema.prop(c, 'AutoUpdate', 'bool');
    % 37 39
    p = vertcat(schema.prop(c, 'Listeners', 'handle.listener vector'), schema.prop(c, 'ChildrenListeners', 'mxArray'));
    % 39 43
    % 40 43
    % 41 43
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 43 45
end % function

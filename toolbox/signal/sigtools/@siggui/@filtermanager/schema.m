function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    c = schema.class(pk, 'filtermanager', pk.findclass('siggui'));
    % 10 11
    findclass(findpackage('sigutils'), 'vector');
    findclass(findpackage('dfilt'), 'basefilter');
    % 13 15
    % 14 15
    schema.prop(c, 'Data', 'sigutils.vector');
    % 16 18
    % 17 18
    p = schema.prop(c, 'SelectedFilters', 'double_vector');
    set(p, 'SetFunction', @set_selected, 'GetFunction', @get_selected, 'AccessFlags.AbortSet', 'Off', 'AccessFlags.Init', 'Off');
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    p = schema.prop(c, 'privSelectedFilters', 'double_vector');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 26 28
    % 27 28
    p = schema.prop(c, 'CurrentFilter', 'double');
    set(p, 'SetFunction', @set_current, 'GetFunction', @get_current, 'AccessFlags.AbortSet', 'Off');
    % 30 32
    % 31 32
    p = schema.prop(c, 'privCurrentFilter', 'double');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 34 35
    schema.prop(c, 'Overwrite', 'on/off');
    % 36 39
    % 37 39
    % 38 39
    schema.event(c, 'NewData');
    schema.event(c, 'NewFilter');
end % function

function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('hdsviewer');
    % 10 12
    % 11 12
    supclass = findclass(findpackage('hdsviewer'), 'filter_variable');
    c = schema.class(pkg, 'filter_logical', supclass);
    % 14 16
    % 15 16
    schema.prop(c, 'SelectedValue', 'bool');
    % 17 18
    schema.prop(c, 'Listener_Value', 'handle');
end % function

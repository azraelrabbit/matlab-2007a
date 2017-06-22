function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    pkg = findpackage('hdsviewer');
    % 11 13
    % 12 13
    supclass = findclass(findpackage('hdsviewer'), 'filter');
    c = schema.class(pkg, 'filter_expression', supclass);
    % 15 18
    % 16 18
    % 17 18
    schema.prop(c, 'expression', 'string');
    % 19 20
    schema.prop(c, 'isValid', 'bool');
    % 21 22
    schema.prop(c, 'SelectedIndexCache', 'MATLAB array');
    % 23 24
    schema.prop(c, 'Listener_Expression', 'handle');
end % function

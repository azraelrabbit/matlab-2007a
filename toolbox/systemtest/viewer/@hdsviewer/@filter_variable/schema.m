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
    c = schema.class(pkg, 'filter_variable', supclass);
    % 15 18
    % 16 18
    % 17 18
    schema.prop(c, 'hdsvariable', 'string');
    % 19 20
    schema.prop(c, 'isgridvariable', 'bool');
    % 21 22
    schema.prop(c, 'SelectedGrid', 'MATLAB array');
    % 23 24
    schema.prop(c, 'iscelled', 'bool');
end % function

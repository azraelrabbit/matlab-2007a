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
    supclass = findclass(findpackage('wrfc'), 'datasource');
    c = schema.class(pkg, 'hdssource', supclass);
    % 14 15
    schema.prop(c, 'RowVar', 'MATLAB array');
    schema.prop(c, 'ColumnVar', 'MATLAB array');
    schema.prop(c, 'MarkerVar', 'MATLAB array');
    schema.prop(c, 'ColorVar', 'MATLAB array');
    schema.prop(c, 'XVar', 'MATLAB array');
    schema.prop(c, 'YVar', 'MATLAB array');
    schema.prop(c, 'ZVar', 'MATLAB array');
    schema.prop(c, 'FilterControl', 'MATLAB array');
    schema.prop(c, 'SrcListener', 'MATLAB array');
end % function

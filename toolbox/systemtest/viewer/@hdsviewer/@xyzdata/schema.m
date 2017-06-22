function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    supclass = findclass(findpackage('wrfc'), 'data');
    % 10 12
    % 11 12
    c = schema.class(findpackage('hdsviewer'), 'xyzdata', supclass);
    % 13 15
    % 14 15
    schema.prop(c, 'XData', 'MATLAB array');
    schema.prop(c, 'YData', 'MATLAB array');
    schema.prop(c, 'ZData', 'MATLAB array');
    schema.prop(c, 'RowData', 'MATLAB array');
    schema.prop(c, 'ColumnData', 'MATLAB array');
    schema.prop(c, 'MarkerData', 'MATLAB array');
    schema.prop(c, 'ColorData', 'MATLAB array');
    % 22 23
    schema.prop(c, 'GridIds', 'MATLAB array');
end % function

function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    superclass = findclass(findpackage('wrfc'), 'plot');
    c = schema.class(findpackage('hdsviewer'), 'plot', superclass);
    % 11 12
    schema.prop(c, 'Waves', 'MATLAB array');
    schema.prop(c, 'RowData', 'MATLAB array');
    schema.prop(c, 'ColumnData', 'MATLAB array');
    schema.prop(c, 'Locked', 'on/off');
end % function

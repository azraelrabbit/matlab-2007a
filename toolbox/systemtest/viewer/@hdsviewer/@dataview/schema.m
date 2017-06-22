function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    superclass = findclass(findpackage('wrfc'), 'dataview');
    c = schema.class(findpackage('hdsviewer'), 'dataview', superclass);
    % 11 12
    schema.prop(c, 'Location', 'MATLAB array');
    schema.prop(c, 'DataSrc', 'MATLAB array');
    schema.prop(c, 'DataSrcListener', 'MATLAB array');
    schema.prop(c, 'DataChangedListener', 'MATLAB array');
    schema.prop(c, 'SelectionListener', 'MATLAB array');
    schema.prop(c, 'Group', 'MATLAB array');
    schema.prop(c, 'Name', 'string');
end % function

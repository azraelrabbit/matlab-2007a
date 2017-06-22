function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    c = schema.class(findpackage('hdsviewer'), 'plotEditor');
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    schema.prop(c, 'Figures', 'MATLAB array');
    schema.prop(c, 'SelectedFigure', 'MATLAB array');
    schema.prop(c, 'jHandle', 'MATLAB array');
    schema.prop(c, 'SelectionListener', 'MATLAB array');
end % function

function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    c = schema.class(findpackage('hdsviewer'), 'viewer');
    % 10 12
    % 11 12
    schema.prop(c, 'FilterCtrl', 'MATLAB array');
    schema.prop(c, 'HDSTableAdaptor', 'MATLAB array');
    schema.prop(c, 'PlotPropertyEditor', 'MATLAB array');
    schema.prop(c, 'jHandle', 'MATLAB array');
    schema.prop(c, 'SelectionListener', 'MATLAB array');
    schema.prop(c, 'SplashScreen', 'MATLAB array');
    schema.prop(c, 'PathCache', 'MATLAB array');
end % function

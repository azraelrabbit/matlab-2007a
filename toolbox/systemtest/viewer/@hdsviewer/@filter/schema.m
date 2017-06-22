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
    c = schema.class(findpackage('hdsviewer'), 'filter');
    c.Handle = 'on';
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    schema.prop(c, 'Name', 'string');
    % 17 19
    % 18 19
    schema.prop(c, 'Parent', 'handle');
    % 20 22
    % 21 22
    schema.prop(c, 'SelectedIndex', 'MATLAB array');
    % 23 25
    % 24 25
    schema.prop(c, 'Active', 'on/off');
    % 26 27
    schema.prop(c, 'Listener_Active', 'handle');
    % 28 30
    % 29 30
    schema.prop(c, 'jHandle', 'MATLAB array');
end % function

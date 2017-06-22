function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    c = schema.class(findpackage('hdsviewer'), 'plotimage');
    % 10 11
    schema.prop(c, 'Locked', 'on/off');
    schema.prop(c, 'SrcListener', 'MATLAB array');
    schema.prop(c, 'Listeners', 'MATLAB array');
    schema.prop(c, 'Figure', 'MATLAB array');
    schema.prop(c, 'Variable', 'string');
end % function

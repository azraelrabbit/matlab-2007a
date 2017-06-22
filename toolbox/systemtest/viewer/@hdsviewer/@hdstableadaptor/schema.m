function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    c = schema.class(findpackage('hdsviewer'), 'hdstableadaptor');
    % 10 12
    % 11 12
    schema.prop(c, 'HDS', 'MATLAB array');
    schema.prop(c, 'HDSTable', 'MATLAB array');
    schema.prop(c, 'HDSCache', 'MATLAB array');
end % function

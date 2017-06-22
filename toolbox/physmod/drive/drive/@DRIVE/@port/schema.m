function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('DRIVE');
    cls = schema.class(pkg, 'port');
    p = schema.prop(cls, 'tag', 'string');
end % function

function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pkg = findpackage('DRIVE');
    cls = schema.class(pkg, 'block');
    p = schema.prop(cls, 'MachineID', 'int32');
end % function

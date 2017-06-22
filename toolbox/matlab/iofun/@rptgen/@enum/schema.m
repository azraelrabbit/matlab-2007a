function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('rptgen');
    pkgSchema = findpackage('schema');
    % 9 10
    h = schema.class(pkg, 'enum', pkgSchema.findclass('EnumType'));
    % 11 12
    p = schema.prop(h, 'DisplayNames', 'string vector');
end % function

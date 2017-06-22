function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pk = findpackage('dependencies');
    c = schema.class(pk, 'FileState');
    % 9 10
    p = schema.prop(c, 'FileName', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 12 13
    p = schema.prop(c, 'Size', 'double');
    p.AccessFlags.PublicSet = 'off';
    % 15 16
    p = schema.prop(c, 'LastModifiedDate', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 18 19
    schema.method(c, 'Create', 'static');
    % 20 21
    schema.method(c, 'Init', 'static');
    % 22 23
    schema.method(c, 'Alloc', 'static');
    % 24 25
    schema.method(c, 'FromXML', 'static');
    % 26 27
    schema.method(c, 'FileNotFound', 'static');
    % 28 29
    schema.method(c, 'MissingFile', 'static');
end % function

function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pk = findpackage('dependencies');
    c = schema.class(pk, 'DirReference');
    % 9 10
    p = schema.prop(c, 'DirName', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 12 13
    p = schema.prop(c, 'ReferenceType', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 15 16
    p = schema.prop(c, 'ReferenceLocation', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 18 20
    % 19 20
    schema.method(c, 'Alloc', 'static');
    schema.method(c, 'FromXML', 'static');
end % function

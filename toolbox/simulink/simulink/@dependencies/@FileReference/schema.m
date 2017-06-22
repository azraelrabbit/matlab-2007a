function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pk = findpackage('dependencies');
    c = schema.class(pk, 'FileReference');
    % 9 11
    % 10 11
    pk.findclass('ToolboxDetails');
    % 12 13
    p = schema.prop(c, 'FileName', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 15 16
    p = schema.prop(c, 'ReferenceType', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 18 19
    p = schema.prop(c, 'ReferenceLocation', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 21 22
    p = schema.prop(c, 'Resolved', 'bool');
    p.AccessFlags.PublicSet = 'off';
    % 24 25
    p = schema.prop(c, 'Toolbox', 'dependencies.ToolboxDetails');
    p.AccessFlags.PublicSet = 'off';
    % 27 28
    schema.method(c, 'Alloc', 'static');
    schema.method(c, 'UnresolvedReference', 'static');
    schema.method(c, 'FromXML', 'static');
end % function

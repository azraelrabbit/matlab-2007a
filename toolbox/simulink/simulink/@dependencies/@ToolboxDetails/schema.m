function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pk = findpackage('dependencies');
    c = schema.class(pk, 'ToolboxDetails');
    % 9 10
    p = schema.prop(c, 'DirectoryName', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 12 13
    p = schema.prop(c, 'Name', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 15 16
    p = schema.prop(c, 'Version', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 18 19
    p = schema.prop(c, 'Release', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 21 22
    p = schema.prop(c, 'Date', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 24 25
    p = schema.prop(c, 'IsMathWorksToolbox', 'bool');
    p.AccessFlags.PublicSet = 'off';
    % 27 28
    schema.method(c, 'IdentifyToolbox', 'static');
    schema.method(c, 'FromXML', 'static');
end % function

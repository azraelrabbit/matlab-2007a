function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    c = schema.class(findpackage('sigcodegen'), 'stringbuffer');
    % 9 11
    % 10 11
    p = schema.prop(c, 'buffer', 'mxArray');
    set(p, 'FactoryValue', {}, 'AccessFlags.Init', 'on', 'AccessFlags.PublicSet', 'Off', 'Description', 'Cell array storing string buffer contents');
end % function

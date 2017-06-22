function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    mlock;
    % 10 11
    pk = findpackage('hdlcoderprops');
    c = schema.class(pk, 'EDAMapping', pk.findclass('AbstractProp'));
    % 13 14
    schema.prop(c, 'hdlmapfilepostfix', 'string');
    schema.prop(c, 'hdlmapseparator', 'string');
    % 16 17
    p = schema.prop(c, 'hdlmapfile', 'bool');
    set(p, 'FactoryValue', true);
    % 19 20
    p = schema.prop(c, 'hdlmaparrow', 'string');
    set(p, 'FactoryValue', '-->');
end % function

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
    c = schema.class(pk, 'EDASynthesis', pk.findclass('AbstractProp'));
    % 13 14
    schema.prop(c, 'hdlsynthcmd', 'string');
    schema.prop(c, 'hdlsynthfilepostfix', 'string');
    schema.prop(c, 'hdlsynthinit', 'string');
    schema.prop(c, 'hdlsynthterm', 'string');
    % 18 21
    % 19 21
    % 20 21
    p = schema.prop(c, 'hdlsynthscript', 'bool');
    set(p, 'FactoryValue', true);
end % function

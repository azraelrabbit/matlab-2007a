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
    c = schema.class(pk, 'EDACompilation', pk.findclass('AbstractProp'));
    % 13 14
    schema.prop(c, 'compile_cmd', 'string');
    % 15 16
    schema.prop(c, 'hdlcompilefilepostfix', 'string');
    schema.prop(c, 'hdlcompileinit', 'string');
    schema.prop(c, 'hdlcompileterm', 'string');
    schema.prop(c, 'hdlcompileverilogcmd', 'string');
    schema.prop(c, 'hdlcompilevhdlcmd', 'string');
    % 21 23
    % 22 23
    p = schema.prop(c, 'hdlcompilescript', 'bool');
    set(p, 'FactoryValue', true);
    % 25 26
    schema.prop(c, 'hdlcompiletb', 'bool');
end % function

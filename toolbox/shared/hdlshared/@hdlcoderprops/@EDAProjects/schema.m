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
    c = schema.class(pk, 'EDAProjects', pk.findclass('AbstractProp'));
    % 13 14
    schema.prop(c, 'hdlsimprojectcmd', 'string');
    schema.prop(c, 'hdlsimprojectterm', 'string');
    schema.prop(c, 'hdlsimprojectfilepostfix', 'string');
    schema.prop(c, 'hdlsimprojectinit', 'string');
    % 18 21
    % 19 21
    % 20 21
    p = schema.prop(c, 'hdlsimprojectscript', 'bool');
    set(p, 'FactoryValue', true);
end % function

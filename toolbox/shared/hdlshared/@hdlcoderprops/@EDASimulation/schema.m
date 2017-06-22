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
    c = schema.class(pk, 'EDASimulation', pk.findclass('AbstractProp'));
    % 13 14
    schema.prop(c, 'hdlsimcmd', 'string');
    schema.prop(c, 'hdlsimfilepostfix', 'string');
    schema.prop(c, 'hdlsiminit', 'string');
    schema.prop(c, 'hdlsimterm', 'string');
    schema.prop(c, 'hdlsimviewwavecmd', 'string');
    % 19 22
    % 20 22
    % 21 22
    p = schema.prop(c, 'hdlsimscript', 'bool');
    set(p, 'FactoryValue', true);
end % function

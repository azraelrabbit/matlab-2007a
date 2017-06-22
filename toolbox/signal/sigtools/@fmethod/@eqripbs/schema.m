function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fmethod');
    c = schema.class(pk, 'eqripbs', pk.findclass('eqripbsmin'));
    % 10 11
    p = schema.prop(c, 'Wpass1', 'posdouble');
    p.FactoryValue = 1.0;
    % 13 14
    p = schema.prop(c, 'Wstop', 'posdouble');
    p.FactoryValue = 1.0;
    % 16 17
    p = schema.prop(c, 'Wpass2', 'posdouble');
    p.FactoryValue = 1.0;
end % function

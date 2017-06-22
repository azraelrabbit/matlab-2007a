function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fmethod');
    c = schema.class(pk, 'firlslp', pk.findclass('abstractfirls'));
    % 10 11
    p = schema.prop(c, 'Wpass', 'posdouble');
    p.FactoryValue = 1.0;
    % 13 14
    p = schema.prop(c, 'Wstop', 'posdouble');
    p.FactoryValue = 1.0;
end % function

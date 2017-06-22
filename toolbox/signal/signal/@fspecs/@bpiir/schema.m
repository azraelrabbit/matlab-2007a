function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    c = schema.class(pk, 'bpiir', pk.findclass('abstractspecwithfs'));
    % 10 11
    p = schema.prop(c, 'NumOrder', 'posint');
    p.FactoryValue = 8.0;
    % 13 14
    p = schema.prop(c, 'DenOrder', 'posint');
    p.FactoryValue = 8.0;
    % 16 17
    p = schema.prop(c, 'Fstop1', 'posdouble');
    p.FactoryValue = .35;
    % 19 20
    p = schema.prop(c, 'Fpass1', 'posdouble');
    p.FactoryValue = .45;
    % 22 23
    p = schema.prop(c, 'Fpass2', 'posdouble');
    p.FactoryValue = .55;
    % 25 26
    p = schema.prop(c, 'Fstop2', 'posdouble');
    p.FactoryValue = .65;
end % function

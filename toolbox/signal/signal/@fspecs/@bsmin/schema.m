function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    parent = findclass(pk, 'abstractspecwithfs');
    c = schema.class(pk, 'bsmin', parent);
    % 11 12
    p = schema.prop(c, 'Fpass1', 'posdouble');
    p.FactoryValue = .35;
    % 14 15
    p = schema.prop(c, 'Fstop1', 'posdouble');
    p.FactoryValue = .45;
    % 17 18
    p = schema.prop(c, 'Fstop2', 'posdouble');
    p.FactoryValue = .55;
    % 20 21
    p = schema.prop(c, 'Fpass2', 'posdouble');
    p.FactoryValue = .65;
    % 23 24
    p = schema.prop(c, 'Apass1', 'posdouble');
    p.FactoryValue = 1.0;
    % 26 27
    p = schema.prop(c, 'Astop', 'posdouble');
    p.FactoryValue = 60.0;
    % 29 30
    p = schema.prop(c, 'Apass2', 'posdouble');
    p.FactoryValue = 1.0;
end % function

function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    parent = findclass(pk, 'abstractspecwithordnfs');
    c = schema.class(pk, 'bppass', parent);
    % 11 12
    p = schema.prop(c, 'Fpass1', 'posdouble');
    p.FactoryValue = .45;
    % 14 15
    p = schema.prop(c, 'Fpass2', 'posdouble');
    p.FactoryValue = .55;
    % 17 18
    p = schema.prop(c, 'Apass', 'posdouble');
    p.FactoryValue = 1.0;
end % function

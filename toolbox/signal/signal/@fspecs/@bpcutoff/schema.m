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
    c = schema.class(pk, 'bpcutoff', parent);
    % 11 12
    p = schema.prop(c, 'Fcutoff1', 'posdouble');
    p.FactoryValue = .4;
    % 14 15
    p = schema.prop(c, 'Fcutoff2', 'posdouble');
    p.FactoryValue = .6;
end % function

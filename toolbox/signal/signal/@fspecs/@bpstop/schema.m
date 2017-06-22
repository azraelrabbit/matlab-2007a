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
    c = schema.class(pk, 'bpstop', parent);
    % 11 12
    p = schema.prop(c, 'Fstop1', 'posdouble');
    p.FactoryValue = .35;
    % 14 15
    p = schema.prop(c, 'Fstop2', 'posdouble');
    p.FactoryValue = .65;
    % 17 18
    p = schema.prop(c, 'Astop', 'posdouble');
    p.FactoryValue = 60.0;
end % function

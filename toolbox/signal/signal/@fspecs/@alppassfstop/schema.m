function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    parent = findclass(pk, 'alppass');
    c = schema.class(pk, 'alppassfstop', parent);
    % 11 12
    p = schema.prop(c, 'Wstop', 'posdouble');
    p.FactoryValue = 13.0;
end % function

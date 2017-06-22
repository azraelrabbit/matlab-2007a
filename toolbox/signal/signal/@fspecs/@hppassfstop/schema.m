function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    parent = findclass(pk, 'hppass');
    c = schema.class(pk, 'hppassfstop', parent);
    % 11 12
    p = schema.prop(c, 'Fstop', 'posdouble');
    p.FactoryValue = .4;
end % function

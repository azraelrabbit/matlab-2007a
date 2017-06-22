function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    c = schema.class(pk, 'abstractcicspecs', pk.findclass('abstractspecwithfs'));
    set(c, 'Description', 'abstract');
    % 11 12
    p = schema.prop(c, 'Fpass', 'posdouble');
    p.FactoryValue = .5;
    % 14 15
    p = schema.prop(c, 'Astop', 'posdouble');
    p.FactoryValue = 60.0;
end % function

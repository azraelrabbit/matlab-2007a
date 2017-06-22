function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    parent = findclass(pk, 'abstractspecwithord');
    c = schema.class(pk, 'alppass', parent);
    % 11 12
    p = schema.prop(c, 'Wpass', 'posdouble');
    p.FactoryValue = 7.0;
    % 14 15
    p = schema.prop(c, 'Apass', 'posdouble');
    p.FactoryValue = 1.0;
end % function

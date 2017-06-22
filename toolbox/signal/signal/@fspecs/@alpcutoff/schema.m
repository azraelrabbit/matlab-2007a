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
    c = schema.class(pk, 'alpcutoff', parent);
    % 11 12
    p = schema.prop(c, 'Wcutoff', 'posdouble');
    p.FactoryValue = 10.0;
end % function

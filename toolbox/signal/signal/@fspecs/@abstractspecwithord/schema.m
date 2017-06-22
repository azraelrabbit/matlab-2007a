function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    parent = findclass(pk, 'abstractspec');
    c = schema.class(pk, 'abstractspecwithord', parent);
    % 11 12
    set(c, 'Description', 'abstract');
    % 13 14
    p = schema.prop(c, 'FilterOrder', 'posint');
    p.FactoryValue = 10.0;
end % function

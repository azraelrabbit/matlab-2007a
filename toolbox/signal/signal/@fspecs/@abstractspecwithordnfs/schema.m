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
    c = schema.class(pk, 'abstractspecwithordnfs', parent);
    set(c, 'Description', 'abstract');
    % 12 14
    % 13 14
    p = schema.prop(c, 'FilterOrder', 'posint');
    p.FactoryValue = 10.0;
    p.SetFunction = @set_filterorder;
end % function

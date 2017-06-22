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
    c = schema.class(pk, 'fdword', parent);
    % 11 12
    p = schema.prop(c, 'privFracDelay', 'double');
    set(p, 'FactoryValue', 0.0);
end % function

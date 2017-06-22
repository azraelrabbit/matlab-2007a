function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('spttippack');
    % 10 12
    % 11 12
    c = findclass(pk, 'datatip');
    % 13 15
    % 14 15
    sc = schema.class(pk, 'linetip', c);
    % 16 18
    % 17 18
    p = schema.prop(sc, 'InterpolationMethod', 'string');
    set(p, 'FactoryValue', 'nearest');
    p = schema.prop(sc, 'Tracking', 'string');
    set(p, 'FactoryValue', 'xy');
    p = schema.prop(sc, 'Index', 'double');
    set(p, 'FactoryValue', 1.0);
end % function

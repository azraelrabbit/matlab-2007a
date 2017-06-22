function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('lwdfilt');
    c = schema.class(pk, 'sos');
    % 10 11
    p = schema.prop(c, 'sosMatrix', 'mxArray');
    set(p, 'FactoryValue', [1.0 0.0 0.0 1.0 0.0 0.0]);
    % 13 14
    p = schema.prop(c, 'ScaleValues', 'mxArray');
    set(p, 'FactoryValue', [1.0 ;  1.0]);
    % 16 17
    p = schema.prop(c, 'refsosMatrix', 'mxArray');
    set(p, 'FactoryValue', [1.0 0.0 0.0 1.0 0.0 0.0]);
    % 19 20
    p = schema.prop(c, 'refScaleValues', 'mxArray');
    set(p, 'FactoryValue', [1.0 ;  1.0]);
end % function

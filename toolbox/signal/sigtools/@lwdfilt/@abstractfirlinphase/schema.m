function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('lwdfilt');
    c = schema.class(pk, 'abstractfirlinphase');
    set(c, 'Description', 'abstract');
    % 11 12
    p = schema.prop(c, 'Numerator', 'mxArray');
    set(p, 'FactoryValue', 1.0);
    % 14 15
    p = schema.prop(c, 'refnum', 'mxArray');
    set(p, 'FactoryValue', 1.0);
end % function

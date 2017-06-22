function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    c = schema.class(pk, 'lpcutoffwfp', pk.findclass('abstractspecwithordnfs'));
    % 10 11
    p = schema.prop(c, 'Fpass', 'posdouble');
    set(p, 'FactoryValue', .45);
    % 13 14
    p = schema.prop(c, 'F3dB', 'posdouble');
    set(p, 'FactoryValue', .5);
end % function

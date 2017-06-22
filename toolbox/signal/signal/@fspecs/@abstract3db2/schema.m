function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    c = schema.class(pk, 'abstract3db2', pk.findclass('abstractspecwithordnfs'));
    % 10 11
    set(c, 'Description', 'abstract');
    % 12 13
    p = schema.prop(c, 'F3dB1', 'posdouble');
    set(p, 'FactoryValue', .4);
    % 15 16
    p = schema.prop(c, 'F3dB2', 'posdouble');
    set(p, 'FactoryValue', .6);
end % function

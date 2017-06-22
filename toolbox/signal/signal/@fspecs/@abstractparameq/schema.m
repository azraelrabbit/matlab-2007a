function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    c = schema.class(pk, 'abstractparameq', pk.findclass('abstractspecwithordnfs'));
    % 10 11
    set(c, 'Description', 'abstract');
    % 12 14
    % 13 14
    p = schema.prop(c, 'Gref', 'double');
    p.FactoryValue = -10.0;
    % 16 17
    p = schema.prop(c, 'G0', 'double');
    p.FactoryValue = 0.0;
    % 19 20
    p = schema.prop(c, 'GBW', 'double');
    p.FactoryValue = mtimes(10.0, log10(.5));
end % function

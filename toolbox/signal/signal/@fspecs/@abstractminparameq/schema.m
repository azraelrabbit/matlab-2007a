function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    c = schema.class(pk, 'abstractminparameq', pk.findclass('abstractspecwithfs'));
    % 10 11
    set(c, 'Description', 'abstract');
    % 12 13
    p = schema.prop(c, 'Gref', 'double');
    p.FactoryValue = -10.0;
    % 15 16
    p = schema.prop(c, 'G0', 'double');
    p.FactoryValue = 0.0;
    % 18 19
    p = schema.prop(c, 'F0', 'double');
    set(p, 'FactoryValue', .5);
    % 21 22
    p = schema.prop(c, 'BW', 'double');
    set(p, 'FactoryValue', .3);
    % 24 25
    p = schema.prop(c, 'GBW', 'double');
    set(p, 'FactoryValue', mtimes(10.0, log10(.5)));
end % function

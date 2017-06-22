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
    c = schema.class(pk, 'octavewordncenterfreq', parent);
    % 11 12
    p = schema.prop(c, 'F0', 'posdouble');
    set(p, 'FactoryValue', .041666666666666664);
    % 14 15
    p = schema.prop(c, 'privBandsPerOctave', 'posint');
    set(p, 'FactoryValue', 1.0);
end % function

function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    c = schema.class(pk, 'nyqmin', pk.findclass('hbmin'));
    % 10 11
    p = schema.prop(c, 'Band', 'posint');
    set(p, 'FactoryValue', 4.0);
end % function

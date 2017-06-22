function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    c = schema.class(pk, 'parameqbwgbwast', pk.findclass('abstractminparameq'));
    % 10 12
    % 11 12
    p = schema.prop(c, 'Gstop', 'double');
    set(p, 'FactoryValue', -9.0);
    % 14 15
    p = schema.prop(c, 'BWstop', 'double');
    set(p, 'FactoryValue', .4);
end % function

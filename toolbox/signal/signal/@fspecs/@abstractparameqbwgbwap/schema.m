function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    c = schema.class(pk, 'abstractparameqbwgbwap', pk.findclass('abstractminparameq'));
    % 10 11
    set(c, 'Description', 'abstract');
    % 12 14
    % 13 14
    p = schema.prop(c, 'Gpass', 'double');
    set(p, 'FactoryValue', -1.0);
    % 16 17
    p = schema.prop(c, 'BWpass', 'double');
    set(p, 'FactoryValue', .2);
end % function

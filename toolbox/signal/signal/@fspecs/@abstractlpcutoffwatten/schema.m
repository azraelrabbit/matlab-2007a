function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    c = schema.class(pk, 'abstractlpcutoffwatten', pk.findclass('abstractlpcutoff'));
    % 10 11
    set(c, 'Description', 'abstract');
    % 12 13
    p = schema.prop(c, 'Apass', 'double');
    set(p, 'FactoryValue', 1.0);
    % 15 16
    p = schema.prop(c, 'Astop', 'double');
    set(p, 'FactoryValue', 60.0);
end % function

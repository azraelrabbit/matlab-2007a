function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'CICDesign', pk.findclass('AbstractDesign'));
    % 10 11
    p = schema.prop(c, 'DifferentialDelay', 'string');
    set(p, 'FactoryValue', '1');
    % 13 14
    p = schema.prop(c, 'Fpass', 'string');
    set(p, 'FactoryValue', '.01');
    % 16 17
    p = schema.prop(c, 'Astop', 'string');
    set(p, 'FactoryValue', '60');
end % function

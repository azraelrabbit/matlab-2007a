function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'HilbertDesign', pk.findclass('AbstractConstrainedDesign'));
    % 10 11
    p = schema.prop(c, 'TransitionWidth', 'string');
    set(p, 'FactoryValue', '.1');
    % 13 14
    p = schema.prop(c, 'Apass', 'string');
    set(p, 'FactoryValue', '1');
end % function

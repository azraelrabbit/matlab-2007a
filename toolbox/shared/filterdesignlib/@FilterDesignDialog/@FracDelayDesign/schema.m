function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'FracDelayDesign', pk.findclass('AbstractDesign'));
    % 10 11
    p = schema.prop(c, 'FracDelay', 'string');
    set(p, 'FactoryValue', '0.5');
end % function

function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('farrow');
    c = schema.class(pk, 'fd', pk.findclass('abstractfd'));
    % 10 11
    p = schema.prop(c, 'Coefficients', 'mxArray');
    set(p, 'FactoryValue', [-1.0 1.0 ;  1.0 0.0], 'GetFunction', @get_coefficients, 'SetFunction', @set_coefficients);
    % 13 14
end % function

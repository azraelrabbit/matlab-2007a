function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdfmethod');
    parent = findclass(pk, 'abstractlpnorm');
    c = schema.class(pk, 'lpnormlp2', parent);
    % 11 12
    p = schema.prop(c, 'Wpass', 'mxArray');
    set(p, 'FactoryValue', 1.0, 'SetFunction', @set_weights);
    % 14 15
    p = schema.prop(c, 'Wstop', 'mxArray');
    set(p, 'FactoryValue', 1.0, 'SetFunction', @set_weights);
end % function

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
    c = schema.class(pk, 'lpnormbs2', parent);
    % 11 12
    p = schema.prop(c, 'Wpass1', 'mxArray');
    set(p, 'FactoryValue', 1.0, 'SetFunction', @set_weights);
    % 14 15
    p = schema.prop(c, 'Wstop', 'mxArray');
    set(p, 'FactoryValue', 1.0, 'SetFunction', @set_weights);
    % 17 18
    p = schema.prop(c, 'Wpass2', 'mxArray');
    set(p, 'FactoryValue', 1.0, 'SetFunction', @set_weights);
end % function

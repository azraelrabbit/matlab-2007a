function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('fspecs');
    c = schema.class(pk, 'abstractmultibandarbmag', pk.findclass('abstractmultiband'));
    set(c, 'Description', 'abstract');
    % 10 13
    % 11 13
    F2 = [.8 .81 .8200000000000001 .8300000000000001 .8400000000000001 .8500000000000001 .8600000000000001 .8700000000000001 .88 .89 .9 .91 .92 .9299999999999999 .94 .95 .96 .97 .98 .99 1.0];
    A1 = [.5 2.3 1.0 1.0 .001 .001 1.0 1.0];
    A2 = plus(.2, mtimes(18.0, power(minus(1.0, F2), 2.0)));
    % 15 17
    p = schema.prop(c, 'B1Amplitudes', 'double_vector');
    set(p, 'FactoryValue', A1, 'SetFunction', @set_amplitudes)
    % 18 20
    p = schema.prop(c, 'B2Amplitudes', 'double_vector');
    set(p, 'FactoryValue', A2, 'SetFunction', @set_amplitudes)
    % 21 23
    p = schema.prop(c, 'B3Amplitudes', 'double_vector');
    set(p, 'FactoryValue', [0.0 0.0], 'SetFunction', @set_amplitudes)
    % 24 26
    p = schema.prop(c, 'B4Amplitudes', 'double_vector');
    set(p, 'FactoryValue', [0.0 0.0], 'SetFunction', @set_amplitudes)
    % 27 29
    p = schema.prop(c, 'B5Amplitudes', 'double_vector');
    set(p, 'FactoryValue', [0.0 0.0], 'SetFunction', @set_amplitudes)
    % 30 32
    p = schema.prop(c, 'B6Amplitudes', 'double_vector');
    set(p, 'FactoryValue', [0.0 0.0], 'SetFunction', @set_amplitudes)
    % 33 35
    p = schema.prop(c, 'B7Amplitudes', 'double_vector');
    set(p, 'FactoryValue', [0.0 0.0], 'SetFunction', @set_amplitudes)
    % 36 38
    p = schema.prop(c, 'B8Amplitudes', 'double_vector');
    set(p, 'FactoryValue', [0.0 0.0], 'SetFunction', @set_amplitudes)
    % 39 41
    p = schema.prop(c, 'B9Amplitudes', 'double_vector');
    set(p, 'FactoryValue', [0.0 0.0], 'SetFunction', @set_amplitudes)
    % 42 44
    p = schema.prop(c, 'B10Amplitudes', 'double_vector');
    set(p, 'FactoryValue', [0.0 0.0], 'SetFunction', @set_amplitudes)
end % function

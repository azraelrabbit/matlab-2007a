function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('fspecs');
    c = schema.class(pk, 'abstractmultiband', pk.findclass('abstractspecwithfs'));
    set(c, 'Description', 'abstract');
    % 10 13
    % 11 13
    F1 = [.2 .38 .4 .55 .562 .585 .6 .78];
    F2 = [.8 .81 .8200000000000001 .8300000000000001 .8400000000000001 .8500000000000001 .8600000000000001 .8700000000000001 .88 .89 .9 .91 .92 .9299999999999999 .94 .95 .96 .97 .98 .99 1.0];
    % 14 16
    p = schema.prop(c, 'NBands', 'posint');
    set(p, 'FactoryValue', 1.0, 'SetFunction', @set_bands)
    % 17 19
    p = schema.prop(c, 'B1Frequencies', 'double_vector');
    set(p, 'FactoryValue', F1, 'SetFunction', @set_frequencies)
    % 20 22
    p = schema.prop(c, 'B2Frequencies', 'double_vector');
    set(p, 'FactoryValue', F2, 'SetFunction', @set_frequencies)
    % 23 25
    p = schema.prop(c, 'B3Frequencies', 'double_vector');
    set(p, 'FactoryValue', [1.0 1.0], 'SetFunction', @set_frequencies)
    % 26 28
    p = schema.prop(c, 'B4Frequencies', 'double_vector');
    set(p, 'FactoryValue', [1.0 1.0], 'SetFunction', @set_frequencies)
    % 29 31
    p = schema.prop(c, 'B5Frequencies', 'double_vector');
    set(p, 'FactoryValue', [1.0 1.0], 'SetFunction', @set_frequencies)
    % 32 34
    p = schema.prop(c, 'B6Frequencies', 'double_vector');
    set(p, 'FactoryValue', [1.0 1.0], 'SetFunction', @set_frequencies)
    % 35 37
    p = schema.prop(c, 'B7Frequencies', 'double_vector');
    set(p, 'FactoryValue', [1.0 1.0], 'SetFunction', @set_frequencies)
    % 38 40
    p = schema.prop(c, 'B8Frequencies', 'double_vector');
    set(p, 'FactoryValue', [1.0 1.0], 'SetFunction', @set_frequencies)
    % 41 43
    p = schema.prop(c, 'B9Frequencies', 'double_vector');
    set(p, 'FactoryValue', [1.0 1.0], 'SetFunction', @set_frequencies)
    % 44 46
    p = schema.prop(c, 'B10Frequencies', 'double_vector');
    set(p, 'FactoryValue', [1.0 1.0], 'SetFunction', @set_frequencies)
end % function

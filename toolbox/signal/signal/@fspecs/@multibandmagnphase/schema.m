function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('fspecs');
    c = schema.class(pk, 'multibandmagnphase', pk.findclass('abstractmultiband'));
    % 9 11
    p = schema.prop(c, 'FilterOrder', 'posint');
    p.FactoryValue = 30.0;
    % 12 15
    % 13 15
    F2 = [.8 .81 .8200000000000001 .8300000000000001 .8400000000000001 .8500000000000001 .8600000000000001 .8700000000000001 .88 .89 .9 .91 .92 .9299999999999999 .94 .95 .96 .97 .98 .99 1.0];
    A1 = [.5 2.3 1.0 1.0 .001 .001 1.0 1.0];
    A2 = plus(.2, mtimes(18.0, power(minus(1.0, F2), 2.0)));
    % 17 19
    p = schema.prop(c, 'B1FreqResponse', 'double_vector');
    set(p, 'FactoryValue', A1, 'SetFunction', @set_freqresp)
    % 20 22
    p = schema.prop(c, 'B2FreqResponse', 'double_vector');
    set(p, 'FactoryValue', A2, 'SetFunction', @set_freqresp)
    % 23 25
    p = schema.prop(c, 'B3FreqResponse', 'double_vector');
    set(p, 'FactoryValue', [0.0 0.0], 'SetFunction', @set_freqresp)
    % 26 28
    p = schema.prop(c, 'B4FreqResponse', 'double_vector');
    set(p, 'FactoryValue', [0.0 0.0], 'SetFunction', @set_freqresp)
    % 29 31
    p = schema.prop(c, 'B5FreqResponse', 'double_vector');
    set(p, 'FactoryValue', [0.0 0.0], 'SetFunction', @set_freqresp)
    % 32 34
    p = schema.prop(c, 'B6FreqResponse', 'double_vector');
    set(p, 'FactoryValue', [0.0 0.0], 'SetFunction', @set_freqresp)
    % 35 37
    p = schema.prop(c, 'B7FreqResponse', 'double_vector');
    set(p, 'FactoryValue', [0.0 0.0], 'SetFunction', @set_freqresp)
    % 38 40
    p = schema.prop(c, 'B8FreqResponse', 'double_vector');
    set(p, 'FactoryValue', [0.0 0.0], 'SetFunction', @set_freqresp)
    % 41 43
    p = schema.prop(c, 'B9FreqResponse', 'double_vector');
    set(p, 'FactoryValue', [0.0 0.0], 'SetFunction', @set_freqresp)
    % 44 46
    p = schema.prop(c, 'B10FreqResponse', 'double_vector');
    set(p, 'FactoryValue', [0.0 0.0], 'SetFunction', @set_freqresp)
end % function

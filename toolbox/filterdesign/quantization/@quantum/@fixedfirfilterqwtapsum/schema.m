function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'fixedfirfilterqwtapsum', findclass(pk, 'fixedfirfilterq'));
    % 10 12
    % 11 12
    p = schema.prop(c, 'TapSumfimath', 'mxArray');
    set(p, 'FactoryValue', fimath('RoundMode', 'convergent', 'OverflowMode', 'wrap', 'ProductMode', 'SpecifyPrecision', 'ProductWordLength', 17.0, 'ProductFractionLength', 15.0, 'SumMode', 'SpecifyPrecision', 'SumWordLength', 17.0, 'SumFractionLength', 15.0), 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    p = schema.prop(c, 'TapSumMode', 'ProductNAccumModeType');
    set(p, 'FactoryValue', 'KeepMSB', 'AccessFlags.AbortSet', 'off', 'SetFunction', @set_tapsummode, 'GetFunction', @get_tapsummode);
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    p = schema.prop(c, 'TapSumWordLength', 'mxArray');
    set(p, 'SetFunction', @set_tapsumwl, 'GetFunction', @get_tapsumwl);
    % 32 34
    % 33 34
    p = schema.prop(c, 'TapSumFracLength', 'mxArray');
    set(p, 'SetFunction', @set_tapsumfl, 'GetFunction', @get_tapsumfl);
    % 36 38
    % 37 38
    p = schema.prop(c, 'privTapSumMode', 'ProductNAccumModeType');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 40 41
end % function

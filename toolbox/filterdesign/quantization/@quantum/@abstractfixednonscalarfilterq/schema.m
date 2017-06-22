function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pk = findpackage('quantum');
    c = schema.class(pk, 'abstractfixednonscalarfilterq', findclass(pk, 'abstractfixedoutfilterq'));
    % 9 10
    p = schema.prop(c, 'ProductMode', 'ProductNAccumModeType');
    set(p, 'AccessFlags.AbortSet', 'off', 'FactoryValue', 'FullPrecision', 'SetFunction', @set_productmode, 'GetFunction', @get_productmode);
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    p = schema.prop(c, 'ProductWordLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_prodwl, 'GetFunction', @get_prodwl);
    % 18 21
    % 19 21
    % 20 21
    p = schema.prop(c, 'AccumMode', 'ProductNAccumModeType');
    set(p, 'AccessFlags.AbortSet', 'off', 'FactoryValue', 'KeepMSB', 'SetFunction', @set_accummode, 'GetFunction', @get_accummode);
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    p = schema.prop(c, 'AccumWordLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_accumwl, 'GetFunction', @get_accumwl);
    % 29 32
    % 30 32
    % 31 32
    p = schema.prop(c, 'CastBeforeSum', 'bool');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_cbs, 'GetFunction', @get_cbs);
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    p = schema.prop(c, 'privProductMode', 'ProductNAccumModeType');
    set(p, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off', 'AccessFlags.Init', 'Off');
    % 40 43
    % 41 43
    % 42 43
    p = schema.prop(c, 'privAccumMode', 'ProductNAccumModeType');
    set(p, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off', 'AccessFlags.Init', 'Off');
    % 45 46
end % function

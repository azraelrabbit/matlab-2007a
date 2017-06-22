function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    % 9 12
    % 10 12
    % 11 12
    c = schema.class(pk, 'fixeddf1filterq', findclass(pk, 'abstractfixedfilterq'));
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(c, 'fimath2', 'mxArray');
    set(p, 'FactoryValue', fimath('RoundMode', 'convergent', 'OverflowMode', 'wrap', 'SumMode', 'KeepMSB', 'SumWordLength', 40.0, 'SumFractionLength', 30.0), 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    p = schema.prop(c, 'NumFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_numfl, 'GetFunction', @get_numfl);
    % 28 31
    % 29 31
    % 30 31
    p = schema.prop(c, 'DenFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_denfl, 'GetFunction', @get_denfl);
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    p = schema.prop(c, 'privcoefffl2', 'int32');
    set(p, 'FactoryValue', 14.0, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 39 42
    % 40 42
    % 41 42
    p = schema.prop(c, 'ProductMode', 'ProductNAccumModeType');
    set(p, 'FactoryValue', 'FullPrecision', 'AccessFlags.AbortSet', 'off', 'SetFunction', @set_productmode, 'GetFunction', @get_productmode);
    % 44 48
    % 45 48
    % 46 48
    % 47 48
    p = schema.prop(c, 'privProductMode', 'ProductNAccumModeType');
    set(p, 'AccessFlags.Init', 'Off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 50 53
    % 51 53
    % 52 53
    p = schema.prop(c, 'ProductWordLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_prodwl, 'GetFunction', @get_prodwl);
    % 55 58
    % 56 58
    % 57 58
    p = schema.prop(c, 'NumProdFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_numprodfl, 'GetFunction', @get_numprodfl);
    % 60 63
    % 61 63
    % 62 63
    p = schema.prop(c, 'DenProdFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_denprodfl, 'GetFunction', @get_denprodfl);
    % 65 68
    % 66 68
    % 67 68
    p = schema.prop(c, 'AccumMode', 'ProductNAccumModeType');
    set(p, 'FactoryValue', 'KeepMSB', 'AccessFlags.AbortSet', 'off', 'SetFunction', @set_accummode, 'GetFunction', @get_accummode);
    % 70 74
    % 71 74
    % 72 74
    % 73 74
    p = schema.prop(c, 'privAccumMode', 'ProductNAccumModeType');
    set(p, 'AccessFlags.Init', 'Off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 76 79
    % 77 79
    % 78 79
    p = schema.prop(c, 'AccumWordLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_accumwl, 'GetFunction', @get_accumwl);
    % 81 84
    % 82 84
    % 83 84
    p = schema.prop(c, 'NumAccumFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_numaccfl, 'GetFunction', @get_numaccfl);
    % 86 89
    % 87 89
    % 88 89
    p = schema.prop(c, 'DenAccumFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_denaccfl, 'GetFunction', @get_denaccfl);
    % 91 94
    % 92 94
    % 93 94
    p = schema.prop(c, 'CastBeforeSum', 'bool');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_cbs, 'GetFunction', @get_cbs);
    % 96 99
    % 97 99
    % 98 99
    p = schema.prop(c, 'OutputWordLength', 'mxArray');
    set(p, 'FactoryValue', 16.0, 'SetFunction', @set_outwl, 'GetFunction', @get_outwl);
    % 101 104
    % 102 104
    % 103 104
    p = schema.prop(c, 'OutputFracLength', 'mxArray');
    set(p, 'FactoryValue', 15.0, 'SetFunction', @set_outfl, 'GetFunction', @get_outfl);
    % 106 109
    % 107 109
    % 108 109
    p = schema.prop(c, 'privoutfl', 'int32');
    set(p, 'AccessFlags.Init', 'Off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 111 114
    % 112 114
    % 113 114
    p = schema.prop(c, 'privoutwl', 'posint');
    set(p, 'AccessFlags.Init', 'Off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 116 117
end % function

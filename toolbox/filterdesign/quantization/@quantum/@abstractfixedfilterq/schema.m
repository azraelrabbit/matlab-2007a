function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    dfiltpk = findpackage('dfilt');
    c = schema.class(pk, 'abstractfixedfilterq', findclass(dfiltpk, 'filterquantizer'));
    % 11 12
    findpackage('sigdatatypes');
    % 13 15
    % 14 15
    p = schema.prop(c, 'fimath', 'mxArray');
    set(p, 'FactoryValue', fimath('RoundMode', 'convergent', 'OverflowMode', 'wrap', 'SumMode', 'SpecifyPrecision', 'ProductMode', 'SpecifyPrecision', 'SumWordLength', 40.0), 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    p = schema.prop(c, 'CoeffWordLength', 'mxArray');
    set(p, 'FactoryValue', 16.0, 'AccessFlags.AbortSet', 'off', 'SetFunction', @set_coeffwl, 'GetFunction', @get_coeffwl);
    % 27 31
    % 28 31
    % 29 31
    % 30 31
    p = schema.prop(c, 'CoeffAutoScale', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'FactoryValue', true, 'GetFunction', @get_coeffautoscale, 'SetFunction', @set_coeffautoscale);
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    p = schema.prop(c, 'Signed', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'FactoryValue', true, 'GetFunction', @get_signed, 'SetFunction', @set_signed);
    % 39 43
    % 40 43
    % 41 43
    % 42 43
    p = schema.prop(c, 'RoundMode', 'RoundType');
    set(p, 'AccessFlags.AbortSet', 'off', 'SetFunction', @set_rm, 'GetFunction', @get_rm);
    % 45 48
    % 46 48
    % 47 48
    p = schema.prop(c, 'OverflowMode', 'OverflowType');
    set(p, 'AccessFlags.AbortSet', 'off', 'SetFunction', @set_om, 'GetFunction', @get_om);
    % 50 53
    % 51 53
    % 52 53
    p = schema.prop(c, 'InputWordLength', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'FactoryValue', 16.0, 'SetFunction', @set_inwl, 'GetFunction', @get_inwl);
    % 55 59
    % 56 59
    % 57 59
    % 58 59
    p = schema.prop(c, 'InputFracLength', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'FactoryValue', 15.0, 'SetFunction', @set_infl, 'GetFunction', @get_infl);
    % 61 65
    % 62 65
    % 63 65
    % 64 65
    p = schema.prop(c, 'InheritSettings', 'bool');
    set(p, 'AccessFlags.AbortSet', 'off', 'FactoryValue', false, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 67 73
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    % 72 73
    p = schema.prop(c, 'privcoeffwl', 'posint');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 75 79
    % 76 79
    % 77 79
    % 78 79
    p = schema.prop(c, 'privCoeffAutoScale', 'bool');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 81 85
    % 82 85
    % 83 85
    % 84 85
    p = schema.prop(c, 'privcoefffl', 'int32');
    set(p, 'FactoryValue', 15.0, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 87 91
    % 88 91
    % 89 91
    % 90 91
    p = schema.prop(c, 'privsigned', 'bool');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 93 96
    % 94 96
    % 95 96
    p = schema.prop(c, 'privinwl', 'posint');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 98 101
    % 99 101
    % 100 101
    p = schema.prop(c, 'privinfl', 'int32');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 103 106
    % 104 106
    % 105 106
    p = schema.prop(c, 'version', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off', 'AccessFlags.PublicGet', 'off', 'GetFunction', @get_version);
    % 108 112
    % 109 112
    % 110 112
    % 111 112
    p = schema.prop(c, 'maxprod', 'mxArray');
    set(p, 'FactoryValue', [], 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 114 117
    % 115 117
    % 116 117
    p = schema.prop(c, 'maxsum', 'mxArray');
    set(p, 'FactoryValue', [], 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 119 120
end % function
function v = get_version(this, v)
    % 122 125
    % 123 125
    % 124 125
    v.number = 3.0;
    v.description = 'R14sp3';
end % function

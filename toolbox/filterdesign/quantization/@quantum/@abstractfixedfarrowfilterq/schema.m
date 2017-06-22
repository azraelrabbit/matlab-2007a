function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'abstractfixedfarrowfilterq', findclass(pk, 'abstractfixedinfilterq'));
    set(c, 'Description', 'abstract');
    % 11 13
    % 12 13
    schema.event(c, 'quantizefracdelay');
    % 14 15
    findpackage('sigdatatypes');
    % 16 18
    % 17 18
    p = schema.prop(c, 'fimath', 'mxArray');
    set(p, 'FactoryValue', fimath('RoundMode', 'convergent', 'OverflowMode', 'wrap', 'SumMode', 'SpecifyPrecision', 'ProductMode', 'SpecifyPrecision', 'SumWordLength', 40.0), 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    p = schema.prop(c, 'fdfimath', 'mxArray');
    p.FactoryValue = fimath('RoundMode', 'convergent', 'OverflowMode', 'wrap', 'ProductMode', 'SpecifyPrecision', 'ProductWordLength', 17.0, 'ProductFractionLength', 15.0, 'SumMode', 'SpecifyPrecision', 'SumWordLength', 17.0, 'SumFractionLength', 15.0);
    % 29 36
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 38 39
    p = schema.prop(c, 'OutputWordLength', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'AccessFlags.Init', 'Off', 'SetFunction', @set_outwl, 'GetFunction', @get_outwl);
    % 41 45
    % 42 45
    % 43 45
    % 44 45
    p = schema.prop(c, 'OutputFracLength', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'AccessFlags.Init', 'Off', 'SetFunction', @set_outfl, 'GetFunction', @get_outfl);
    % 47 51
    % 48 51
    % 49 51
    % 50 51
    p = schema.prop(c, 'FDWordLength', 'mxArray');
    p.FactoryValue = 6.0;
    p.AccessFlags.AbortSet = 'off';
    p.SetFunction = @set_fdwl;
    p.GetFunction = @get_fdwl;
    p.AccessFlags.Serialize = 'off';
    % 57 58
    p = schema.prop(c, 'FDAutoScale', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'FactoryValue', true, 'GetFunction', @get_fdautoscale, 'SetFunction', @set_fdautoscale);
    % 60 64
    % 61 64
    % 62 64
    % 63 64
    p = schema.prop(c, 'FDFracLength', 'mxArray');
    p.FactoryValue = 5.0;
    p.AccessFlags.AbortSet = 'off';
    p.SetFunction = @set_fdfl;
    p.GetFunction = @get_fdfl;
    p.AccessFlags.Serialize = 'off';
    % 70 71
    p = schema.prop(c, 'FilterInternals', 'FilterInternalsType');
    set(p, 'AccessFlags.AbortSet', 'off', 'SetFunction', @set_filterinternals);
    % 73 75
    % 74 75
    p = schema.prop(c, 'ProductWordLength', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'GetFunction', @get_prodwl, 'SetFunction', @set_prodwl);
    % 77 80
    % 78 80
    % 79 80
    p = schema.prop(c, 'ProductFracLength', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'GetFunction', @get_prodfl, 'SetFunction', @set_prodfl);
    % 82 85
    % 83 85
    % 84 85
    p = schema.prop(c, 'AccumWordLength', 'mxArray');
    set(p, 'FactoryValue', 40.0, 'AccessFlags.AbortSet', 'off', 'SetFunction', @set_accumwl, 'GetFunction', @get_accumwl);
    % 87 91
    % 88 91
    % 89 91
    % 90 91
    p = schema.prop(c, 'AccumFracLength', 'mxArray');
    set(p, 'FactoryValue', 30.0, 'AccessFlags.AbortSet', 'off', 'SetFunction', @set_accumfl, 'GetFunction', @get_accumfl);
    % 93 97
    % 94 97
    % 95 97
    % 96 97
    p = schema.prop(c, 'RoundMode', 'RoundType');
    set(p, 'AccessFlags.AbortSet', 'off', 'SetFunction', @set_rm, 'GetFunction', @get_rm);
    % 99 102
    % 100 102
    % 101 102
    p = schema.prop(c, 'OverflowMode', 'OverflowType');
    set(p, 'AccessFlags.AbortSet', 'off', 'SetFunction', @set_om, 'GetFunction', @get_om);
    % 104 108
    % 105 108
    % 106 108
    % 107 108
    p = schema.prop(c, 'privoutwl', 'posint');
    set(p, 'FactoryValue', 16.0, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 110 113
    % 111 113
    % 112 113
    p = schema.prop(c, 'privoutfl', 'int32');
    set(p, 'FactoryValue', 15.0, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 115 118
    % 116 118
    % 117 118
    p = schema.prop(c, 'privFilterInternals', 'FilterInternalsType');
    set(p, 'AccessFlags.AbortSet', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 120 123
    % 121 123
    % 122 123
    p = schema.prop(c, 'privfdautoscale', 'bool');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 125 128
    % 126 128
    % 127 128
    p = schema.prop(c, 'privfdwl', 'posint');
    p.FactoryValue = 6.0;
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 132 133
    p = schema.prop(c, 'privfdfl', 'int32');
    p.FactoryValue = 5.0;
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 137 138
    p = schema.prop(c, 'maxprod', 'mxArray');
    set(p, 'FactoryValue', [], 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 140 143
    % 141 143
    % 142 143
    p = schema.prop(c, 'maxsum', 'mxArray');
    set(p, 'FactoryValue', [], 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 145 148
    % 146 148
    % 147 148
    p = schema.prop(c, 'version', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off', 'AccessFlags.PublicGet', 'off', 'GetFunction', @get_version);
    % 150 152
    % 151 152
end % function
function v = get_version(this, v)
    % 154 157
    % 155 157
    % 156 157
    v.number = 1.0;
    v.description = 'R2006b';
end % function

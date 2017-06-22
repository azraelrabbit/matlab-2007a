function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    spk = findpackage('dfilt');
    c = schema.class(pk, 'abstractcicfilterq', spk.findclass('filterquantizer'));
    set(c, 'Description', 'abstract');
    % 12 14
    % 13 14
    if isempty(findtype('SectionWordLengthModes'))
        schema.EnumType('SectionWordLengthModes', {'MinWordLengths','SpecifyWordLengths'});
    end % if
    % 17 18
    if isempty(findtype('CICFilterInternalsType'))
        schema.EnumType('CICFilterInternalsType', {'FullPrecision','MinWordLengths','SpecifyWordLengths','SpecifyPrecision'});
        % 20 21
    end % if
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    p = schema.prop(c, 'RoundMode', 'string');
    set(p, 'FactoryValue', 'floor', 'AccessFlags.PublicSet', 'Off');
    % 29 30
    p = schema.prop(c, 'OverflowMode', 'string');
    set(p, 'FactoryValue', 'wrap', 'AccessFlags.PublicSet', 'Off');
    % 32 33
    p = schema.prop(c, 'CastBeforeSum', 'bool');
    set(p, 'FactoryValue', 1.0, 'AccessFlags.PublicSet', 'Off');
    % 35 37
    % 36 37
    p = schema.prop(c, 'InputWordLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_inputwordlength, 'GetFunction', @get_inputwordlength);
    % 39 43
    % 40 43
    % 41 43
    % 42 43
    p = schema.prop(c, 'privInputWordLength', 'posint');
    set(p, 'FactoryValue', 16.0, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    % 49 50
    p = schema.prop(c, 'OutputWordLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_outputwordlength, 'GetFunction', @get_outputwordlength);
    % 52 55
    % 53 55
    % 54 55
    p = schema.prop(c, 'privOutputWordLength', 'posint');
    set(p, 'FactoryValue', 18.0, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
    % 57 61
    % 58 61
    % 59 61
    % 60 61
    p = schema.prop(c, 'SectionWordLengthMode', 'SectionWordLengthModes');
    set(p, 'SetFunction', @set_sectionwordlengthmode, 'GetFunction', @get_sectionwordlengthmode, 'visible', 'off');
    % 63 65
    % 64 65
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    % 67 70
    % 68 70
    % 69 70
    p = schema.prop(c, 'privSectionWordLengthMode', 'SectionWordLengthModes');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 72 73
    p = schema.prop(c, 'FilterInternals', 'CICFilterInternalsType');
    set(p, 'AccessFlags.AbortSet', 'off', 'FactoryValue', 'FullPrecision', 'SetFunction', @set_filterinternals, 'GetFunction', @get_filterinternals);
    % 75 79
    % 76 79
    % 77 79
    % 78 79
    p = schema.prop(c, 'privFilterInternals', 'CICFilterInternalsType');
    set(p, 'AccessFlags.AbortSet', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 81 84
    % 82 84
    % 83 84
    p = schema.prop(c, 'SectionWordLengths', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'AccessFlags.AbortSet', 'Off', 'SetFunction', @set_sectionwordlengths, 'GetFunction', @get_sectionwordlengths);
    % 86 91
    % 87 91
    % 88 91
    % 89 91
    % 90 91
    p = schema.prop(c, 'privSectionWordLengths', 'posint_vector');
    set(p, 'FactoryValue', [18.0 18.0 18.0 18.0], 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 93 95
    % 94 95
    p = schema.prop(c, 'InputFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_inputfraclength, 'GetFunction', @get_inputfraclength);
    % 97 101
    % 98 101
    % 99 101
    % 100 101
    p = schema.prop(c, 'privInputFracLength', 'int32');
    set(p, 'FactoryValue', 15.0, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
    % 103 107
    % 104 107
    % 105 107
    % 106 107
    p = schema.prop(c, 'SectionFracLengths', 'mxArray');
    set(p, 'GetFunction', @get_sectionfraclengths, 'SetFunction', @set_sectionfraclengths);
    % 109 110
    p = schema.prop(c, 'privSectionFracLengths', 'mxArray');
    set(p, 'FactoryValue', [15.0 15.0 15.0 15.0], 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
    % 112 116
    % 113 116
    % 114 116
    % 115 116
    p = schema.prop(c, 'OutputFracLength', 'mxArray');
    set(p, 'GetFunction', @get_outputfraclength, 'SetFunction', @set_outputfraclength);
    p.AccessFlags.Init = 'off';
    % 119 120
    p = schema.prop(c, 'privOutputFracLength', 'int32');
    set(p, 'FactoryValue', 15.0, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
    % 122 129
    % 123 129
    % 124 129
    % 125 129
    % 126 129
    % 127 129
    % 128 129
    p = schema.prop(c, 'Initializing', 'strictbool');
    set(p, 'FactoryValue', false, 'Visible', 'Off');
    % 131 133
    % 132 133
    schema.event(c, 'updateinternals');
end % function

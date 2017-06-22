function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'fixeddf1tsosfilterq', findclass(pk, 'abstractfixedsos2filterq'));
    % 10 11
    p = schema.prop(c, 'SectionInputAutoScale', 'mxArray');
    set(p, 'FactoryValue', true, 'GetFunction', @get_stageinputautoscale, 'SetFunction', @set_stageinputautoscale);
    % 13 16
    % 14 16
    % 15 16
    p = schema.prop(c, 'SectionInputFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_stageinfl, 'GetFunction', @get_stageinfl);
    % 18 21
    % 19 21
    % 20 21
    p = schema.prop(c, 'SectionOutputAutoScale', 'bool');
    set(p, 'FactoryValue', true, 'GetFunction', @get_stageoutputautoscale, 'SetFunction', @set_stageoutputautoscale);
    % 23 26
    % 24 26
    % 25 26
    p = schema.prop(c, 'SectionOutputFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_stageoutfl, 'GetFunction', @get_stageoutfl);
    % 28 31
    % 29 31
    % 30 31
    p = schema.prop(c, 'StateAutoScale', 'bool');
    set(p, 'AccessFlags.AbortSet', 'off', 'FactoryValue', true, 'GetFunction', @get_stateautoscale, 'SetFunction', @set_stateautoscale);
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    p = schema.prop(c, 'NumStateFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_nstatefl, 'GetFunction', @get_nstatefl);
    % 40 43
    % 41 43
    % 42 43
    p = schema.prop(c, 'DenStateFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_dstatefl, 'GetFunction', @get_dstatefl);
    % 45 48
    % 46 48
    % 47 48
    p = schema.prop(c, 'MultiplicandWordLength', 'mxArray');
    set(p, 'FactoryValue', 16.0, 'SetFunction', @set_multwl, 'GetFunction', @get_multwl);
    % 50 53
    % 51 53
    % 52 53
    p = schema.prop(c, 'MultiplicandFracLength', 'mxArray');
    set(p, 'FactoryValue', 15.0, 'SetFunction', @set_multfl, 'GetFunction', @get_multfl);
    % 55 59
    % 56 59
    % 57 59
    % 58 59
    p = schema.prop(c, 'StageInputAutoScale', 'mxArray');
    siguddutils('setupobsolete', p, 'SectionInputAutoScale', false);
    % 61 62
    p = schema.prop(c, 'StageInputFracLength', 'mxArray');
    siguddutils('setupobsolete', p, 'SectionInputFracLength', false);
    % 64 65
    p = schema.prop(c, 'StageOutputAutoScale', 'mxArray');
    siguddutils('setupobsolete', p, 'SectionOutputAutoScale', false);
    % 67 68
    p = schema.prop(c, 'StageOutputFracLength', 'mxArray');
    siguddutils('setupobsolete', p, 'SectionOutputFracLength', false);
    % 70 72
    % 71 72
    p = schema.prop(c, 'privSectionInputAutoScale', 'bool');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 74 77
    % 75 77
    % 76 77
    p = schema.prop(c, 'privSectionOutputAutoScale', 'bool');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 79 82
    % 80 82
    % 81 82
    p = schema.prop(c, 'privnstatefl', 'int32');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 84 87
    % 85 87
    % 86 87
    p = schema.prop(c, 'privdstatefl', 'int32');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 89 92
    % 90 92
    % 91 92
    p = schema.prop(c, 'privStateAutoScale', 'bool');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 94 97
    % 95 97
    % 96 97
    p = schema.prop(c, 'privmultwl', 'posint');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 99 102
    % 100 102
    % 101 102
    p = schema.prop(c, 'privmultfl', 'int32');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 104 105
end % function

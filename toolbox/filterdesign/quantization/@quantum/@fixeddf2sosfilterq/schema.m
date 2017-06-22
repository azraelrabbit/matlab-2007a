function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'fixeddf2sosfilterq', findclass(pk, 'abstractfixedsos2filterq'));
    % 10 11
    p = schema.prop(c, 'StateFracLength', 'mxArray');
    set(p, 'FactoryValue', 15.0, 'SetFunction', @set_statefl, 'GetFunction', @get_statefl);
    % 13 16
    % 14 16
    % 15 16
    p = schema.prop(c, 'SectionInputAutoScale', 'mxArray');
    set(p, 'FactoryValue', true, 'GetFunction', @get_stageinputautoscale, 'SetFunction', @set_stageinputautoscale);
    % 18 21
    % 19 21
    % 20 21
    p = schema.prop(c, 'SectionInputFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_stageinfl, 'GetFunction', @get_stageinfl);
    % 23 26
    % 24 26
    % 25 26
    p = schema.prop(c, 'SectionOutputAutoScale', 'mxArray');
    set(p, 'FactoryValue', true, 'GetFunction', @get_stageoutputautoscale, 'SetFunction', @set_stageoutputautoscale);
    % 28 31
    % 29 31
    % 30 31
    p = schema.prop(c, 'SectionOutputFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_stageoutfl, 'GetFunction', @get_stageoutfl);
    % 33 36
    % 34 36
    % 35 36
    p = schema.prop(c, 'StageInputAutoScale', 'mxArray');
    siguddutils('setupobsolete', p, 'SectionInputAutoScale', false);
    % 38 39
    p = schema.prop(c, 'StageInputFracLength', 'mxArray');
    siguddutils('setupobsolete', p, 'SectionInputFracLength', false);
    % 41 42
    p = schema.prop(c, 'StageOutputAutoScale', 'mxArray');
    siguddutils('setupobsolete', p, 'SectionOutputAutoScale', false);
    % 44 45
    p = schema.prop(c, 'StageOutputFracLength', 'mxArray');
    siguddutils('setupobsolete', p, 'SectionOutputFracLength', false);
    % 47 48
    p = schema.prop(c, 'privSectionInputAutoScale', 'bool');
    set(p, 'AccessFlags.Init', 'Off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 50 53
    % 51 53
    % 52 53
    p = schema.prop(c, 'privSectionOutputAutoScale', 'bool');
    set(p, 'AccessFlags.Init', 'Off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 55 56
end % function

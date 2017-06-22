function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'fixeddf2tsosfilterq', findclass(pk, 'abstractfixedsos2filterq'));
    % 10 11
    p = schema.prop(c, 'StateAutoScale', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'FactoryValue', true, 'GetFunction', @get_stateautoscale, 'SetFunction', @set_stateautoscale);
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(c, 'StateFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'GetFunction', @get_statefl, 'SetFunction', @lcl_set_statefl);
    % 19 22
    % 20 22
    % 21 22
    p = schema.prop(c, 'SectionInputFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'GetFunction', @get_stageinfl, 'SetFunction', @set_stageinfl);
    % 24 27
    % 25 27
    % 26 27
    p = schema.prop(c, 'SectionOutputFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'GetFunction', @get_stageoutfl, 'SetFunction', @set_stageoutfl);
    % 29 33
    % 30 33
    % 31 33
    % 32 33
    p = schema.prop(c, 'StageInputFracLength', 'mxArray');
    siguddutils('setupobsolete', p, 'SectionInputFracLength', false);
    % 35 36
    p = schema.prop(c, 'StageOutputFracLength', 'mxArray');
    siguddutils('setupobsolete', p, 'SectionOutputFracLength', false);
    % 38 40
    % 39 40
    p = schema.prop(c, 'privStateAutoScale', 'bool');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 42 43
end % function
function sfl = lcl_set_statefl(this, sfl)
    % 45 48
    % 46 48
    % 47 48
    if this.StateAutoScale
        siguddutils('readonlyerror', 'StateFracLength', 'StateAutoScale', false);
    end % if
    % 51 52
    sfl = set_statefl(this, sfl);
end % function

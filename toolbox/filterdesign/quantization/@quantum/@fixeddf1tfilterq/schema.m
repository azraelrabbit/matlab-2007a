function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'fixeddf1tfilterq', findclass(pk, 'abstractfixediirfilterq'));
    % 10 11
    p = schema.prop(c, 'StateWordLength', 'mxArray');
    set(p, 'FactoryValue', 16.0, 'SetFunction', @set_statewl, 'GetFunction', @get_statewl);
    % 13 16
    % 14 16
    % 15 16
    p = schema.prop(c, 'StateAutoScale', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'FactoryValue', true, 'GetFunction', @get_stateautoscale, 'SetFunction', @set_stateautoscale);
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    p = schema.prop(c, 'NumStateFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_nstatefl, 'GetFunction', @get_nstatefl);
    % 24 27
    % 25 27
    % 26 27
    p = schema.prop(c, 'DenStateFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_dstatefl, 'GetFunction', @get_dstatefl);
    % 29 32
    % 30 32
    % 31 32
    p = schema.prop(c, 'MultiplicandWordLength', 'mxArray');
    set(p, 'FactoryValue', 16.0, 'SetFunction', @set_multwl, 'GetFunction', @get_multwl);
    % 34 37
    % 35 37
    % 36 37
    p = schema.prop(c, 'MultiplicandFracLength', 'mxArray');
    set(p, 'FactoryValue', 15.0, 'SetFunction', @set_multfl, 'GetFunction', @get_multfl);
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    % 43 44
    p = schema.prop(c, 'privstatewl', 'posint');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 46 49
    % 47 49
    % 48 49
    p = schema.prop(c, 'privnstatefl', 'int32');
    set(p, 'FactoryValue', 15.0, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 51 54
    % 52 54
    % 53 54
    p = schema.prop(c, 'privdstatefl', 'int32');
    set(p, 'FactoryValue', 15.0, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 56 59
    % 57 59
    % 58 59
    p = schema.prop(c, 'privStateAutoScale', 'bool');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 61 64
    % 62 64
    % 63 64
    p = schema.prop(c, 'privmultwl', 'posint');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 66 69
    % 67 69
    % 68 69
    p = schema.prop(c, 'privmultfl', 'int32');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 71 72
end % function

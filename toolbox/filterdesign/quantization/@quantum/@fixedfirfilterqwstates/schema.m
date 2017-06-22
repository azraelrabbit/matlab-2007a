function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'fixedfirfilterqwstates', findclass(pk, 'fixedfirfilterq'));
    % 10 11
    p = schema.prop(c, 'StateWordLength', 'mxArray');
    set(p, 'FactoryValue', 16.0, 'AccessFlags.AbortSet', 'off', 'SetFunction', @set_statewl, 'GetFunction', @get_statewl);
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(c, 'StateAutoScale', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'FactoryValue', true, 'SetFunction', @set_stateautoscale, 'GetFunction', @get_stateautoscale);
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    p = schema.prop(c, 'StateFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_statefl, 'GetFunction', @get_statefl);
    % 25 28
    % 26 28
    % 27 28
    p = schema.prop(c, 'privstatewl', 'int32');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 30 33
    % 31 33
    % 32 33
    p = schema.prop(c, 'privStateAutoScale', 'bool');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 35 38
    % 36 38
    % 37 38
    p = schema.prop(c, 'privstatefl', 'int32');
    set(p, 'FactoryValue', 15.0, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 40 41
end % function

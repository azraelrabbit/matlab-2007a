function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'fixeddf2tfilterq', findclass(pk, 'fixeddf1filterq'));
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
    p = schema.prop(c, 'StateFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_statefl, 'GetFunction', @get_statefl);
    % 24 27
    % 25 27
    % 26 27
    p = schema.prop(c, 'privstatewl', 'posint');
    set(p, 'AccessFlags.Init', 'Off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 29 32
    % 30 32
    % 31 32
    p = schema.prop(c, 'privStateAutoScale', 'bool');
    set(p, 'AccessFlags.Init', 'Off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 34 37
    % 35 37
    % 36 37
    p = schema.prop(c, 'privstatefl', 'int32');
    set(p, 'FactoryValue', 15.0, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 39 40
end % function

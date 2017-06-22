function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'fixeddf2filterq', findclass(pk, 'abstractfixediirfilterq'));
    % 10 11
    p = schema.prop(c, 'StateWordLength', 'mxArray');
    set(p, 'FactoryValue', 16.0, 'SetFunction', @set_statewl, 'GetFunction', @get_statewl);
    % 13 16
    % 14 16
    % 15 16
    p = schema.prop(c, 'privstatewl', 'posint');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 18 21
    % 19 21
    % 20 21
    p = schema.prop(c, 'StateFracLength', 'mxArray');
    set(p, 'FactoryValue', 15.0, 'SetFunction', @set_statefl, 'GetFunction', @get_statefl);
    % 23 26
    % 24 26
    % 25 26
    p = schema.prop(c, 'privstatefl', 'int32');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 28 29
end % function

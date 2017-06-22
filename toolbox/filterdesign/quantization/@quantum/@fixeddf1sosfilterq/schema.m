function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'fixeddf1sosfilterq', findclass(pk, 'abstractfixedsosfilterq'));
    % 10 11
    p = schema.prop(c, 'NumStateWordLength', 'mxArray');
    set(p, 'FactoryValue', 16.0, 'SetFunction', @set_nstatewl, 'GetFunction', @get_nstatewl);
    % 13 16
    % 14 16
    % 15 16
    p = schema.prop(c, 'DenStateWordLength', 'mxArray');
    set(p, 'FactoryValue', 16.0, 'SetFunction', @set_dstatewl, 'GetFunction', @get_dstatewl);
    % 18 21
    % 19 21
    % 20 21
    p = schema.prop(c, 'NumStateFracLength', 'mxArray');
    set(p, 'FactoryValue', 15.0, 'SetFunction', @set_nstatefl, 'GetFunction', @get_nstatefl);
    % 23 26
    % 24 26
    % 25 26
    p = schema.prop(c, 'DenStateFracLength', 'mxArray');
    set(p, 'FactoryValue', 15.0, 'SetFunction', @set_dstatefl, 'GetFunction', @get_dstatefl);
    % 28 31
    % 29 31
    % 30 31
    p = schema.prop(c, 'privnstatewl', 'posint');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 33 36
    % 34 36
    % 35 36
    p = schema.prop(c, 'privdstatewl', 'posint');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 38 41
    % 39 41
    % 40 41
    p = schema.prop(c, 'privnstatefl', 'int32');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 43 46
    % 44 46
    % 45 46
    p = schema.prop(c, 'privdstatefl', 'int32');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 48 49
end % function

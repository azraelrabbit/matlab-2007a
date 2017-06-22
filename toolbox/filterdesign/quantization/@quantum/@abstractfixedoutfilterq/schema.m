function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'abstractfixedoutfilterq', findclass(pk, 'abstractfixedfilterq'));
    set(c, 'Description', 'abstract');
    % 11 12
    findpackage('sigdatatypes');
    % 13 14
    p = schema.prop(c, 'OutputWordLength', 'mxArray');
    set(p, 'FactoryValue', 16.0, 'AccessFlags.AbortSet', 'off', 'SetFunction', @set_outwl, 'GetFunction', @get_outwl);
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    p = schema.prop(c, 'OutputMode', 'OutputModeType');
    set(p, 'AccessFlags.AbortSet', 'off', 'FactoryValue', 'AvoidOverflow', 'SetFunction', @set_outputmode, 'GetFunction', @get_outputmode);
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    p = schema.prop(c, 'OutputFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_outfl, 'GetFunction', @get_outfl);
    % 30 33
    % 31 33
    % 32 33
    p = schema.prop(c, 'privoutwl', 'posint');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 35 38
    % 36 38
    % 37 38
    p = schema.prop(c, 'privOutputMode', 'OutputModeType');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 40 43
    % 41 43
    % 42 43
    p = schema.prop(c, 'privoutfl', 'int32');
    set(p, 'FactoryValue', 15.0, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 45 46
end % function

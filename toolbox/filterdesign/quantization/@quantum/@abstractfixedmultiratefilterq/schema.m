function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'abstractfixedmultiratefilterq', findclass(pk, 'abstractfixedfilterq'));
    set(c, 'Description', 'abstract');
    % 11 13
    % 12 13
    schema.event(c, 'quantizeacc');
    % 14 15
    p = schema.prop(c, 'NumFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_numfl, 'GetFunction', @get_numfl);
    % 17 20
    % 18 20
    % 19 20
    p = schema.prop(c, 'FilterInternals', 'FilterInternalsType');
    set(p, 'AccessFlags.AbortSet', 'off', 'SetFunction', @set_filterinternals);
    % 22 24
    % 23 24
    p = schema.prop(c, 'OutputWordLength', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'AccessFlags.Init', 'Off', 'SetFunction', @set_outwl, 'GetFunction', @get_outwl);
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    p = schema.prop(c, 'OutputFracLength', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'AccessFlags.Init', 'Off', 'SetFunction', @set_outfl, 'GetFunction', @get_outfl);
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    p = schema.prop(c, 'ProductWordLength', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'GetFunction', @get_prodwl, 'SetFunction', @set_prodwl);
    % 38 41
    % 39 41
    % 40 41
    p = schema.prop(c, 'ProductFracLength', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'GetFunction', @get_prodfl, 'SetFunction', @set_prodfl);
    % 43 46
    % 44 46
    % 45 46
    p = schema.prop(c, 'AccumWordLength', 'mxArray');
    set(p, 'FactoryValue', 40.0, 'AccessFlags.AbortSet', 'off', 'SetFunction', @set_accumwl, 'GetFunction', @get_accumwl);
    % 48 52
    % 49 52
    % 50 52
    % 51 52
    p = schema.prop(c, 'AccumFracLength', 'mxArray');
    set(p, 'FactoryValue', 30.0, 'AccessFlags.AbortSet', 'off', 'SetFunction', @set_accumfl, 'GetFunction', @get_accumfl);
    % 54 59
    % 55 59
    % 56 59
    % 57 59
    % 58 59
    p = schema.prop(c, 'privFilterInternals', 'FilterInternalsType');
    set(p, 'AccessFlags.AbortSet', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 61 64
    % 62 64
    % 63 64
    p = schema.prop(c, 'privoutwl', 'posint');
    set(p, 'FactoryValue', 16.0, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 66 69
    % 67 69
    % 68 69
    p = schema.prop(c, 'privoutfl', 'int32');
    set(p, 'FactoryValue', 15.0, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 71 72
end % function

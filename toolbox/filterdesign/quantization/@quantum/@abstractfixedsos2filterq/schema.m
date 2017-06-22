function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'abstractfixedsos2filterq', findclass(pk, 'abstractfixedsosfilterq'));
    set(c, 'Description', 'abstract');
    % 11 12
    p = schema.prop(c, 'StateWordLength', 'mxArray');
    set(p, 'FactoryValue', 16.0, 'SetFunction', @set_statewl, 'GetFunction', @get_statewl);
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(c, 'SectionInputWordLength', 'mxArray');
    set(p, 'FactoryValue', 16.0, 'SetFunction', @set_stageinwl, 'GetFunction', @get_stageinwl);
    % 19 22
    % 20 22
    % 21 22
    p = schema.prop(c, 'StageInputWordLength', 'mxArray');
    siguddutils('setupobsolete', p, 'SectionInputWordLength', false);
    % 24 25
    p = schema.prop(c, 'SectionOutputWordLength', 'mxArray');
    set(p, 'FactoryValue', 16.0, 'GetFunction', @get_stageoutwl, 'SetFunction', @set_stageoutwl);
    % 27 30
    % 28 30
    % 29 30
    p = schema.prop(c, 'StageOutputWordLength', 'mxArray');
    siguddutils('setupobsolete', p, 'SectionOutputWordLength', false);
    % 32 33
    p = schema.prop(c, 'privstatewl', 'posint');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 35 38
    % 36 38
    % 37 38
    p = schema.prop(c, 'privstatefl', 'int32');
    set(p, 'FactoryValue', 15.0, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 40 43
    % 41 43
    % 42 43
    p = schema.prop(c, 'privstageinwl', 'posint');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 45 48
    % 46 48
    % 47 48
    p = schema.prop(c, 'privstageinfl', 'int32');
    set(p, 'FactoryValue', 15.0, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 50 53
    % 51 53
    % 52 53
    p = schema.prop(c, 'privstageoutwl', 'posint');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 55 58
    % 56 58
    % 57 58
    p = schema.prop(c, 'privstageoutfl', 'int32');
    set(p, 'FactoryValue', 15.0, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 60 61
end % function

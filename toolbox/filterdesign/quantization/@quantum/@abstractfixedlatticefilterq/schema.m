function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'abstractfixedlatticefilterq', pk.findclass('abstractfixednonscalarfilterq'));
    % 9 11
    set(c, 'Description', 'abstract');
    % 11 13
    p = schema.prop(c, 'LatticeFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', cellhorzcat(@set_numfl, 'LatticeFracLength'), 'GetFunction', @get_numfl);
    % 14 18
    % 15 18
    % 16 18
    p = schema.prop(c, 'StateWordLength', 'mxArray');
    set(p, 'FactoryValue', 16.0, 'SetFunction', @set_statewl, 'GetFunction', @get_statewl);
    % 19 23
    % 20 23
    % 21 23
    p = schema.prop(c, 'StateFracLength', 'mxArray');
    set(p, 'FactoryValue', 15.0, 'SetFunction', @set_statefl, 'GetFunction', @get_statefl);
    % 24 28
    % 25 28
    % 26 28
    p = schema.prop(c, 'privstatewl', 'posint');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 29 33
    % 30 33
    % 31 33
    p = schema.prop(c, 'privstatefl', 'int32');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 34 36
end % function

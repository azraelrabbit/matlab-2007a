function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    dfiltpk = findpackage('dfilt');
    c = schema.class(pk, 'abstractfixedinfilterq', findclass(dfiltpk, 'filterquantizer'));
    set(c, 'Description', 'abstract');
    % 12 13
    p = schema.prop(c, 'InputWordLength', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'FactoryValue', 16.0, 'SetFunction', @set_inwl, 'GetFunction', @get_inwl);
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    p = schema.prop(c, 'InputFracLength', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'FactoryValue', 15.0, 'SetFunction', @set_infl, 'GetFunction', @get_infl);
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    p = schema.prop(c, 'privinwl', 'posint');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 27 30
    % 28 30
    % 29 30
    p = schema.prop(c, 'privinfl', 'int32');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 32 35
    % 33 35
    % 34 35
    p = schema.prop(c, 'InheritSettings', 'bool');
    p.AccessFlags.AbortSet = 'off';
    p.FactoryValue = false;
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
end % function

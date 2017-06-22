function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pk = findpackage('quantum');
    c = schema.class(pk, 'abstractfixediirfilterq', findclass(pk, 'abstractfixednonscalarfilterq'));
    % 9 11
    % 10 11
    p = schema.prop(c, 'fimath2', 'mxArray');
    set(p, 'FactoryValue', fimath('RoundMode', 'convergent', 'OverflowMode', 'wrap', 'SumMode', 'KeepMSB', 'SumWordLength', 40.0, 'SumFractionLength', 30.0), 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    p = schema.prop(c, 'NumAccumFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_numaccumfl, 'GetFunction', @get_numaccumfl);
    % 22 25
    % 23 25
    % 24 25
    p = schema.prop(c, 'DenAccumFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_denaccumfl, 'GetFunction', @get_denaccumfl);
    % 27 30
    % 28 30
    % 29 30
    p = schema.prop(c, 'NumProdFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_numprodfl, 'GetFunction', @get_numprodfl);
    % 32 35
    % 33 35
    % 34 35
    p = schema.prop(c, 'DenProdFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_denprodfl, 'GetFunction', @get_denprodfl);
    % 37 40
    % 38 40
    % 39 40
    p = schema.prop(c, 'NumFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_numfl, 'GetFunction', @get_numfl);
    % 42 45
    % 43 45
    % 44 45
    p = schema.prop(c, 'DenFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_denfl, 'GetFunction', @get_denfl);
    % 47 51
    % 48 51
    % 49 51
    % 50 51
    p = schema.prop(c, 'privcoefffl2', 'int32');
    set(p, 'FactoryValue', 15.0, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 53 54
end % function

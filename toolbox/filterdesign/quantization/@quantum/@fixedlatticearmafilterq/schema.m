function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'fixedlatticearmafilterq', findclass(pk, 'abstractfixedlatticefilterq'));
    % 10 12
    % 11 12
    p = schema.prop(c, 'fimath2', 'mxArray');
    set(p, 'FactoryValue', fimath('RoundMode', 'convergent', 'OverflowMode', 'wrap', 'SumMode', 'KeepMSB', 'SumWordLength', 40.0, 'SumFractionLength', 30.0), 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    p = schema.prop(c, 'LadderFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_ladfl, 'GetFunction', @get_ladfl);
    % 23 26
    % 24 26
    % 25 26
    p = schema.prop(c, 'LatticeProdFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_latprodfl, 'GetFunction', @get_prodfl);
    % 28 31
    % 29 31
    % 30 31
    p = schema.prop(c, 'LadderProdFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_ladprodfl, 'GetFunction', @get_ladprodfl);
    % 33 36
    % 34 36
    % 35 36
    p = schema.prop(c, 'LatticeAccumFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_lataccumfl, 'GetFunction', @get_accumfl);
    % 38 41
    % 39 41
    % 40 41
    p = schema.prop(c, 'LadderAccumFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_ladaccumfl, 'GetFunction', @get_ladaccumfl);
    % 43 47
    % 44 47
    % 45 47
    % 46 47
    p = schema.prop(c, 'privcoefffl2', 'int32');
    set(p, 'FactoryValue', 15.0, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 49 50
end % function

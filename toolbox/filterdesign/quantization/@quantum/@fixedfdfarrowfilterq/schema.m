function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'fixedfdfarrowfilterq', pk.findclass('abstractfixedfarrowfilterq'));
    % 10 11
    findpackage('sigdatatypes');
    % 12 13
    p = schema.prop(c, 'CoeffWordLength', 'mxArray');
    set(p, 'FactoryValue', 16.0, 'AccessFlags.AbortSet', 'off', 'SetFunction', @set_coeffwl, 'GetFunction', @get_coeffwl);
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    p = schema.prop(c, 'CoeffAutoScale', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'FactoryValue', true, 'GetFunction', @get_coeffautoscale, 'SetFunction', @set_coeffautoscale);
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    p = schema.prop(c, 'CoeffFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_coefffl, 'GetFunction', @get_coefffl);
    % 27 30
    % 28 30
    % 29 30
    p = schema.prop(c, 'Signed', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'off', 'FactoryValue', true, 'GetFunction', @get_signed, 'SetFunction', @set_signed);
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    p = schema.prop(c, 'MultiplicandWordLength', 'mxArray');
    p.FactoryValue = 16.0;
    p.AccessFlags.AbortSet = 'off';
    p.SetFunction = @set_mwl;
    p.GetFunction = @get_mwl;
    p.AccessFlags.Serialize = 'off';
    % 43 44
    p = schema.prop(c, 'MultiplicandFracLength', 'mxArray');
    p.FactoryValue = 15.0;
    p.AccessFlags.AbortSet = 'off';
    p.SetFunction = @set_mfl;
    p.GetFunction = @get_mfl;
    p.AccessFlags.Serialize = 'off';
    % 50 51
    p = schema.prop(c, 'FDProdWordLength', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    p.SetFunction = @set_fdprodwl;
    p.GetFunction = @get_fdprodwl;
    p.AccessFlags.Serialize = 'off';
    % 56 57
    p = schema.prop(c, 'FDProdFracLength', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    p.SetFunction = @set_fdprodfl;
    p.GetFunction = @get_fdprodfl;
    p.AccessFlags.Serialize = 'off';
    % 62 66
    % 63 66
    % 64 66
    % 65 66
    p = schema.prop(c, 'privcoeffwl', 'posint');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 68 72
    % 69 72
    % 70 72
    % 71 72
    p = schema.prop(c, 'privCoeffAutoScale', 'bool');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 74 78
    % 75 78
    % 76 78
    % 77 78
    p = schema.prop(c, 'privcoefffl', 'int32');
    set(p, 'FactoryValue', 15.0, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 80 84
    % 81 84
    % 82 84
    % 83 84
    p = schema.prop(c, 'privsigned', 'bool');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 86 89
    % 87 89
    % 88 89
    p = schema.prop(c, 'privmultwl', 'posint');
    p.FactoryValue = 16.0;
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 93 94
    p = schema.prop(c, 'privmultfl', 'int32');
    p.FactoryValue = 15.0;
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
end % function

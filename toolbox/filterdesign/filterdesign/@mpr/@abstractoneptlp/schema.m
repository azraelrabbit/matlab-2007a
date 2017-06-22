function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('mpr');
    c = schema.class(pk, 'abstractoneptlp');
    set(c, 'Description', 'abstract');
    % 11 13
    % 12 13
    p = schema.prop(c, 'M', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 16 18
    % 17 18
    p = schema.prop(c, 'fgrid', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 21 23
    % 22 23
    p = schema.prop(c, 'fext', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 26 28
    % 27 28
    p = schema.prop(c, 'Agrid', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 31 33
    % 32 33
    p = schema.prop(c, 'Aext', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 36 38
    % 37 38
    p = schema.prop(c, 'Ggrid', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 41 43
    % 42 43
    p = schema.prop(c, 'Gext', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 46 48
    % 47 48
    p = schema.prop(c, 'Wgrid', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 51 53
    % 52 53
    p = schema.prop(c, 'Wext', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 56 58
    % 57 58
    p = schema.prop(c, 'errgrid', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 61 63
    % 62 63
    p = schema.prop(c, 'errext', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 66 68
    % 67 68
    p = schema.prop(c, 'analyticerr', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    p.FactoryValue = 1e+06;
    set(p, 'AccessFlags.PublicSet', 'off');
    % 72 74
    % 73 74
    p = schema.prop(c, 'measurederr', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    p.FactoryValue = 100000.0;
    set(p, 'AccessFlags.PublicSet', 'off');
    % 78 80
    % 79 80
    p = schema.prop(c, 'DensityFactor', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    p.FactoryValue = 16.0;
    set(p, 'AccessFlags.PublicSet', 'off');
    % 84 86
    % 85 86
    p = schema.prop(c, 'iter', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    p.FactoryValue = 0.0;
    set(p, 'AccessFlags.PublicSet', 'off');
end % function

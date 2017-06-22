function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkgFP = findpackage('rptgen_fp');
    pkgSL = findpackage('rptgen_sl');
    % 9 10
    h = schema.class(pkgFP, 'propsrc_fp_blk', pkgSL.findclass('propsrc_sl_blk'));
    % 11 14
    % 12 14
    % 13 14
    p = schema.prop(h, 'SignalInfo', 'MATLAB array');
    p.AccessFlags.Reset = 'on';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.FactoryValue = [];
    % 19 20
    p = schema.prop(h, 'PropertyListeners', 'handle vector');
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
end % function

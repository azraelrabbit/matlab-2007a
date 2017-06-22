function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'fixedlinearfdfilterq', findclass(pk, 'abstractfixedfarrowfilterq'));
    % 10 12
    % 11 12
    p = schema.prop(c, 'TapSumWordLength', 'mxArray');
    p.FactoryValue = 17.0;
    p.AccessFlags.AbortSet = 'off';
    p.SetFunction = @set_tapsumwl;
    p.GetFunction = @get_tapsumwl;
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 19 20
    p = schema.prop(c, 'TapSumFracLength', 'mxArray');
    p.FactoryValue = 15.0;
    p.AccessFlags.AbortSet = 'off';
    p.SetFunction = @set_tapsumfl;
    p.GetFunction = @get_tapsumfl;
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.PublicSet = 'off';
end % function

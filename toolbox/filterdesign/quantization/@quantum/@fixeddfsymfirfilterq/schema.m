function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'fixeddfsymfirfilterq', findclass(pk, 'abstractfixeddffirmultiratefilterq'));
    % 10 11
    findpackage('sigdatatypes');
    % 12 14
    % 13 14
    p = schema.prop(c, 'TapSumfimath', 'mxArray');
    p.FactoryValue = fimath('RoundMode', 'convergent', 'OverflowMode', 'wrap', 'ProductMode', 'SpecifyPrecision', 'ProductWordLength', 17.0, 'ProductFractionLength', 15.0, 'SumMode', 'SpecifyPrecision', 'SumWordLength', 17.0, 'SumFractionLength', 15.0);
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 25 26
    p = schema.prop(c, 'TapSumWordLength', 'mxArray');
    p.FactoryValue = 17.0;
    p.AccessFlags.AbortSet = 'off';
    p.SetFunction = @set_tapsumwl;
    p.GetFunction = @get_tapsumwl;
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 33 34
    p = schema.prop(c, 'TapSumFracLength', 'mxArray');
    p.FactoryValue = 15.0;
    p.AccessFlags.AbortSet = 'off';
    p.SetFunction = @set_tapsumfl;
    p.GetFunction = @get_tapsumfl;
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.PublicSet = 'off';
end % function

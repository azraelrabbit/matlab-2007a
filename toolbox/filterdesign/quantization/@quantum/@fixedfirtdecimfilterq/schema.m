function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'fixedfirtdecimfilterq', findclass(pk, 'abstractfixedmultiratefilterq'));
    % 10 11
    findpackage('sigdatatypes');
    % 12 14
    % 13 14
    p = schema.prop(c, 'PolyAccfimath', 'mxArray');
    p.FactoryValue = fimath('RoundMode', 'convergent', 'OverflowMode', 'wrap', 'SumMode', 'SpecifyPrecision', 'ProductMode', 'SpecifyPrecision', 'CastBeforeSum', false);
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 22 23
    p = schema.prop(c, 'StateWordLength', 'mxArray');
    p.FactoryValue = 16.0;
    p.AccessFlags.AbortSet = 'off';
    p.SetFunction = @set_statewl;
    p.GetFunction = @get_statewl;
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 30 31
    p = schema.prop(c, 'StateFracLength', 'mxArray');
    p.FactoryValue = 15.0;
    p.AccessFlags.AbortSet = 'off';
    p.SetFunction = @set_statefl;
    p.GetFunction = @get_statefl;
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 38 39
    p = schema.prop(c, 'privstatewl', 'int32');
    p.FactoryValue = 16.0;
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 43 44
    p = schema.prop(c, 'privstatefl', 'int32');
    p.FactoryValue = 15.0;
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 48 49
    p = schema.prop(c, 'PolyAccWordLength', 'mxArray');
    p.FactoryValue = 33.0;
    p.AccessFlags.AbortSet = 'off';
    p.SetFunction = @set_polyaccwl;
    p.GetFunction = @get_polyaccwl;
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 56 57
    p = schema.prop(c, 'PolyAccFracLength', 'mxArray');
    p.FactoryValue = 30.0;
    p.AccessFlags.AbortSet = 'off';
    p.SetFunction = @set_polyaccfl;
    p.GetFunction = @get_polyaccfl;
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.PublicSet = 'off';
end % function

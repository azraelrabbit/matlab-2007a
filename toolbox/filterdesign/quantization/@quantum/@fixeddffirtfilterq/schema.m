function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'fixeddffirtfilterq', findclass(pk, 'abstractfixeddffirmultiratefilterq'));
    % 10 11
    findpackage('sigdatatypes');
    % 12 13
    p = schema.prop(c, 'StateWordLength', 'mxArray');
    p.FactoryValue = 16.0;
    p.AccessFlags.AbortSet = 'off';
    p.SetFunction = @set_statewl;
    p.GetFunction = @get_statewl;
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 20 21
    p = schema.prop(c, 'StateFracLength', 'mxArray');
    p.FactoryValue = 15.0;
    p.AccessFlags.AbortSet = 'off';
    p.SetFunction = @set_statefl;
    p.GetFunction = @get_statefl;
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 28 29
    p = schema.prop(c, 'privstatewl', 'int32');
    p.FactoryValue = 16.0;
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 33 34
    p = schema.prop(c, 'privstatefl', 'int32');
    p.FactoryValue = 15.0;
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
end % function

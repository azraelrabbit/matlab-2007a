function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if isempty(findtype('limitedstopbandshapes'))
        schema.EnumType('limitedstopbandshapes', {'flat','linear'});
    end % if
    % 11 12
    if isempty(findtype('stopbandshapes'))
        schema.EnumType('stopbandshapes', {'flat','linear','1/f'});
    end % if
    % 15 16
    if isempty(findtype('minorderrestrict'))
        schema.EnumType('minorderrestrict', {'any','even','odd'});
    end % if
    % 19 20
    pk = findpackage('fmethod');
    c = schema.class(pk, 'abstracteqrip', pk.findclass('abstractfir'));
    set(c, 'Description', 'abstract');
    % 23 24
    p = schema.prop(c, 'DensityFactor', 'double');
    set(p, 'AccessFlags.AbortSet', 'Off', 'AccessFlags.Init', 'Off', 'AccessFlags.Serialize', 'Off', 'AccessFlags.Copy', 'Off', 'SetFunction', @set_densityfactor, 'GetFunction', @get_densityfactor);
    % 26 33
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    % 32 33
    p = schema.prop(c, 'privDensityFactor', 'double');
    set(p, 'FactoryValue', 16.0, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 35 39
    % 36 39
    % 37 39
    % 38 39
    p = schema.prop(c, 'MinPhase', 'bool');
    set(p, 'AccessFlags.AbortSet', 'Off', 'AccessFlags.Init', 'Off', 'AccessFlags.Serialize', 'Off', 'AccessFlags.Copy', 'Off', 'SetFunction', @set_minphase, 'GetFunction', @get_minphase);
    % 41 48
    % 42 48
    % 43 48
    % 44 48
    % 45 48
    % 46 48
    % 47 48
    p = schema.prop(c, 'privMinPhase', 'bool');
    set(p, 'FactoryValue', false, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 50 52
    % 51 52
end % function

function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdtbxgui');
    c = schema.class(pk, 'wordnfrac', pk.findclass('abstractwordnfrac'));
    % 10 11
    schema.prop(c, 'WordLabel2', 'string');
    p = schema.prop(c, 'WordLength2', 'string');
    set(p, 'FactoryValue', '16');
    % 14 15
    p = schema.prop(c, 'AutoScale', 'on/off');
    set(p, 'FactoryValue', 'On', 'GetFunction', @getautoscale);
    % 17 18
    p = schema.prop(c, 'AutoScaleAvailable', 'on/off');
    set(p, 'FactoryValue', 'On');
    % 20 21
    p = schema.prop(c, 'AutoScaleDescription', 'string');
    set(p, 'FactoryValue', 'Avoid overflow');
    % 23 24
    p = schema.prop(c, 'MaxWord', 'posint');
    set(p, 'FactoryValue', 1.0);
    % 26 27
    p = schema.prop(c, 'Maximum', 'posint');
    set(p, 'FactoryValue', 4.0);
    % 29 30
    p = schema.prop(c, 'privFracLengths', 'string vector');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off', 'AccessFlags.Init', 'Off');
end % function
function as = getautoscale(this, as)
    % 34 37
    % 35 37
    % 36 37
    if strcmpi(this.AutoScaleAvailable, 'off')
        as = 'off';
    end % if
end % function

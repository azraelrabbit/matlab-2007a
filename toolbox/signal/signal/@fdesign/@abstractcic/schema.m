function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'abstractcic', pk.findclass('abstracttypewspecs'));
    set(c, 'Description', 'abstract');
    % 11 13
    % 12 13
    if isempty(findtype('cicSpecTypes'))
        schema.EnumType('cicSpecTypes', {'Fp,Ast'});
        % 15 16
    end % if
    p = schema.prop(c, 'Specification', 'cicSpecTypes');
    set(p, 'SetFunction', @set_specification, 'GetFunction', @get_specification, 'AccessFlags.AbortSet', 'Off');
    % 19 21
    % 20 21
    p = schema.prop(c, 'privDifferentialDelay', 'posint');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off', 'FactoryValue', 1.0);
    % 23 25
    % 24 25
    p = schema.prop(c, 'DifferentialDelay', 'posint');
    set(p, 'SetFunction', @set_differentialdelay, 'GetFunction', @get_differentialdelay, 'AccessFlags.Init', 'Off', 'AccessFlags.Abortset', 'Off');
end % function

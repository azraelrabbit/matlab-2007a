function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'abstractmultirate', pk.findclass('abstracttypewspecs'));
    set(c, 'Description', 'abstract');
    % 11 12
    if isempty(findtype('multirateSpecsTypes'))
        schema.EnumType('multirateSpecsTypes', {'TW,Ast','PL,TW','PL','PL,Ast'});
        % 14 18
        % 15 18
        % 16 18
        % 17 18
    end % if
    % 19 20
    p = schema.prop(c, 'Specification', 'multirateSpecsTypes');
    set(p, 'SetFunction', @set_specification, 'GetFunction', @get_specification, 'AccessFlags.AbortSet', 'Off');
    % 22 24
    % 23 24
    p = schema.prop(c, 'privPolyphaseLength', 'posint');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off', 'FactoryValue', 24.0);
end % function

function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'fracdelay', pk.findclass('abstracttypewspecs'));
    % 10 11
    if isempty(findtype('fracdelaySpecTypes'))
        schema.EnumType('fracdelaySpecTypes', {'N'});
    end % if
    % 14 15
    p = schema.prop(c, 'Specification', 'fracdelaySpecTypes');
    set(p, 'SetFunction', @set_specification, 'GetFunction', @get_specification, 'AccessFlags.AbortSet', 'Off');
    % 17 19
    % 18 19
    p = schema.prop(c, 'FracDelay', 'double');
    set(p, 'FactoryValue', 0.0, 'AccessFlags.AbortSet', 'off', 'Setfunction', @set_delay);
end % function

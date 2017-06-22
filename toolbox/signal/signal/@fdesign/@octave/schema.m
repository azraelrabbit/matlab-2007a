function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'octave', pk.findclass('abstracttypewspecs'));
    % 10 11
    if isempty(findtype('octaveSpecTypes'))
        schema.EnumType('octaveSpecTypes', {'N,F0'});
    end % if
    % 14 15
    if isempty(findtype('octaveMaskSpecTypes'))
        schema.EnumType('octaveMaskSpecTypes', {'Class 0','Class 1','Class 2'});
    end % if
    % 18 19
    p = schema.prop(c, 'Specification', 'octaveSpecTypes');
    set(p, 'SetFunction', @set_specification, 'GetFunction', @get_specification, 'AccessFlags.AbortSet', 'Off');
    % 21 23
    % 22 23
    p = schema.prop(c, 'BandsPerOctave', 'posint');
    set(p, 'FactoryValue', 1.0, 'AccessFlags.AbortSet', 'off', 'SetFunction', @set_bandsperoctave);
    % 25 26
    p = schema.prop(c, 'Mask', 'octaveMaskSpecTypes');
    set(p, 'AccessFlags.AbortSet', 'off');
end % function

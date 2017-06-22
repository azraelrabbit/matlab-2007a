function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('dspdata');
    c = schema.class(pk, 'maskline');
    % 10 11
    p = schema.prop(c, 'EnableMask', 'bool');
    % 12 13
    p = schema.prop(c, 'NormalizedFrequency', 'bool');
    set(p, 'FactoryValue', true);
    % 15 16
    p = schema.prop(c, 'FrequencyVector', 'double_vector');
    set(p, 'FactoryValue', [0.0 .4 .5 1.0]);
    % 18 19
    if isempty(findtype('MagnitudeUnitTypes'))
        schema.EnumType('MagnitudeUnitTypes', {'dB','Linear','Squared'});
    end % if
    % 22 23
    schema.prop(c, 'MagnitudeUnits', 'MagnitudeUnitTypes');
    % 24 25
    p = schema.prop(c, 'MagnitudeVector', 'mxArray');
    set(p, 'SetFunction', @set_magnitudevector, 'GetFunction', @get_magnitudevector, 'AccessFlags.Init', 'Off');
    % 27 31
    % 28 31
    % 29 31
    % 30 31
    p = schema.prop(c, 'privMagnitudeVector', 'double_vector');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off', 'FactoryValue', [1.0 1.0 .01 .01]);
    % 33 34
end % function

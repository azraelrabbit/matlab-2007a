function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    c = schema.class(pk, 'masklinedlg', pk.findclass('helpdialog'));
    % 10 11
    findclass(findpackage('dspdata'), 'maskline');
    % 12 14
    % 13 14
    schema.prop(c, 'EnableMask', 'bool');
    schema.prop(c, 'NormalizedFrequency', 'bool');
    schema.prop(c, 'FrequencyVector', 'string');
    schema.prop(c, 'MagnitudeUnits', 'MagnitudeUnitTypes');
    schema.prop(c, 'MagnitudeVector', 'string');
    p = schema.prop(c, 'FrequencyUnits', 'string');
    set(p, 'FactoryValue', 'Hz');
    % 21 22
    p = schema.prop(c, 'Listener', 'handle.listener');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end % function

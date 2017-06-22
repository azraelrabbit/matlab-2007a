function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('filtdes');
    % 9 11
    % 10 11
    c = schema.class(pk, 'abstractDesignMethodwFs', findclass(pk, 'abstractDesignMethod'));
    c.description = 'abstract';
    % 13 15
    % 14 15
    p = schema.prop(c, 'freqUnits', 'signalFrequencyUnits');
    p.FactoryValue = 'Hz';
    % 17 19
    % 18 19
    p = schema.prop(c, 'freqUnitsListener', 'handle.listener');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
end % function

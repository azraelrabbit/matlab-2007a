function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdadesignpanel');
    % 9 11
    % 10 11
    c = schema.class(pk, 'abstractfiltertypewfs', findclass(pk, 'abstractfiltertype'));
    c.Description = 'abstract';
    % 13 15
    % 14 15
    p = schema.prop(c, 'freqUnits', 'signalFrequencyUnits');
    p.FactoryValue = 'Hz';
    p.Description = 'spec';
    % 18 19
    p = schema.prop(c, 'Fs', 'string');
    p.FactoryValue = '48000';
    p.Description = 'spec';
end % function

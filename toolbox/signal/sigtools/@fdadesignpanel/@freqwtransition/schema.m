function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdadesignpanel');
    % 9 10
    c = schema.class(pk, 'freqwtransition', pk.findclass('abstractfreqwbw'));
    c.Description = 'abstract';
    % 12 13
    p = schema.prop(c, 'Rolloff', 'string');
    p.FactoryValue = '.25';
    p.Description = 'spec';
end % function

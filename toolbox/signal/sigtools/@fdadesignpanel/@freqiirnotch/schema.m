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
    c = schema.class(pk, 'freqiirnotch', pk.findclass('abstractfreqwbw'));
    % 11 12
    p = schema.prop(c, 'Q', 'string');
    set(p, 'Description', 'spec', 'FactoryValue', '45');
end % function

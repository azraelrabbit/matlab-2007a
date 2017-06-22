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
    c = schema.class(pk, 'freqiirpeakwfpeak', pk.findclass('freqiirnotch'));
    % 11 12
    p = schema.prop(c, 'Fpeak', 'string');
    set(p, 'Description', 'spec', 'FactoryValue', '9600');
end % function

function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigwin');
    % 9 10
    c = schema.class(pk, 'blackman', pk.findclass('samplingflagwin'));
    % 11 13
    % 12 13
    p = schema.prop(c, 'Name', 'string');
    set(p, 'AccessFlags.PublicSet', 'Off', 'FactoryValue', 'Blackman');
end % function

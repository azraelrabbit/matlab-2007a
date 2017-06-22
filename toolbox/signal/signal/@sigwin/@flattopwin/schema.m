function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigwin');
    % 9 11
    % 10 11
    c = schema.class(pk, 'flattopwin', pk.findclass('samplingflagwin'));
    % 12 14
    % 13 14
    p = schema.prop(c, 'Name', 'string');
    set(p, 'AccessFlags.PublicSet', 'Off', 'FactoryValue', 'Flat Top');
end % function

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
    c = schema.class(pk, 'bartlett', pk.findclass('simplewin'));
    % 11 13
    % 12 13
    p = schema.prop(c, 'Name', 'string');
    set(p, 'AccessFlags.PublicSet', 'Off', 'FactoryValue', 'Bartlett');
end % function

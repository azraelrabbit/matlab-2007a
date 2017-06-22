function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdadesignpanel');
    c = schema.class(pk, 'lpmagul', pk.findclass('abstractmagul'));
    % 10 11
    p = schema.prop(c, 'DpassUpper', 'string');
    set(p, 'FactoryValue', '.1', 'Description', 'spec');
    % 13 14
    p = schema.prop(c, 'DpassLower', 'string');
    set(p, 'FactoryValue', '.1', 'Description', 'spec');
    % 16 17
    p = schema.prop(c, 'DstopUpper', 'string');
    set(p, 'FactoryValue', '.1', 'Description', 'spec');
    % 19 20
    p = schema.prop(c, 'DstopLower', 'string');
    set(p, 'FactoryValue', '.1', 'Description', 'spec');
end % function

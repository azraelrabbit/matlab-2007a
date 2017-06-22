function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    pk = findpackage('sigwin');
    % 11 12
    c = schema.class(pk, 'variablelength', pk.findclass('window'));
    c.Description = 'abstract';
    % 14 16
    % 15 16
    p = schema.prop(c, 'Length', 'spt_uint32');
    p.FactoryValue = 64.0;
end % function

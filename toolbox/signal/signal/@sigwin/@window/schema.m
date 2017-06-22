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
    % 11 13
    % 12 13
    c = schema.class(pk, 'window');
    c.Description = 'abstract';
    % 15 17
    % 16 17
    p = schema.prop(c, 'Version', 'double');
    set(p, 'FactoryValue', 1.0, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
    % 19 20
end % function

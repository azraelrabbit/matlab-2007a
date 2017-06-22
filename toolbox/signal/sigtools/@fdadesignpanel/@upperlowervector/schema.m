function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdadesignpanel');
    c = schema.class(pk, 'upperlowervector', pk.findclass('freqvector'));
    % 10 11
    p = schema.prop(c, 'MagnitudeVector', 'string');
    set(p, 'FactoryValue', '[0 1 0]', 'Description', 'spec');
    % 13 14
    p = schema.prop(c, 'UpperVector', 'string');
    set(p, 'FactoryValue', '[.1 1.02 .1]', 'Description', 'spec');
    % 16 17
    p = schema.prop(c, 'LowerVector', 'string');
    set(p, 'FactoryValue', '[-.1 .98 -.1]', 'Description', 'spec');
end % function

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
    c = schema.class(pk, 'abstractmagc', findclass(pk, 'abstractmagframe'));
    c.Description = 'abstract';
    % 12 13
    p = schema.prop(c, 'ConstrainedBands', 'double_vector');
    set(p, 'FactoryValue', [], 'Description', 'spec');
end % function

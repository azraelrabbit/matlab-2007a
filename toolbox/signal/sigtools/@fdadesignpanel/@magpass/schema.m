function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdadesignpanel');
    % 9 11
    % 10 11
    c = schema.class(pk, 'magpass', findclass(pk, 'abstractmagframe'));
    % 12 13
    p = schema.prop(c, 'Apass', 'string');
    p.FactoryValue = '1';
    p.Description = 'spec';
    % 16 17
    p = schema.prop(c, 'Dpass', 'string');
    p.FactoryValue = '1';
    p.Description = 'spec';
    % 20 21
    p = schema.prop(c, 'Epass', 'string');
    p.FactoryValue = '0.9';
    p.Description = 'spec';
end % function

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
    c = schema.class(pk, 'freqcutoff2', findclass(pk, 'abstractfiltertypewfs'));
    % 12 14
    % 13 14
    p = schema.prop(c, 'Fc1', 'string');
    p.FactoryValue = '8400';
    p.Description = 'spec';
    % 17 18
    p = schema.prop(c, 'Fc2', 'string');
    p.FactoryValue = '13200';
    p.Description = 'spec';
end % function

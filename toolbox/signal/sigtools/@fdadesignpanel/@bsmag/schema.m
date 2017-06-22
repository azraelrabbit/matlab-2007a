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
    c = schema.class(pk, 'bsmag', findclass(pk, 'abstractmagframe'));
    % 12 14
    % 13 14
    p = schema.prop(c, 'Apass1', 'string');
    p.FactoryValue = '.5';
    p.Description = 'spec';
    % 17 18
    p = schema.prop(c, 'Astop', 'string');
    p.FactoryValue = '60';
    p.Description = 'spec';
    % 21 22
    p = schema.prop(c, 'Apass2', 'string');
    p.FactoryValue = '1';
    p.Description = 'spec';
    % 25 26
    p = schema.prop(c, 'Dpass1', 'string');
    p.FactoryValue = '0.1';
    p.Description = 'spec';
    % 29 30
    p = schema.prop(c, 'Dstop', 'string');
    p.FactoryValue = '0.0001';
    p.Description = 'spec';
    % 33 34
    p = schema.prop(c, 'Dpass2', 'string');
    p.FactoryValue = '0.1';
    p.Description = 'spec';
    % 37 38
    p = schema.prop(c, 'Epass1', 'string');
    p.FactoryValue = '0.9';
    p.Description = 'spec';
    % 41 42
    p = schema.prop(c, 'Estop', 'string');
    p.FactoryValue = '0.001';
    p.Description = 'spec';
    % 45 46
    p = schema.prop(c, 'Epass2', 'string');
    p.FactoryValue = '0.9';
    p.Description = 'spec';
end % function

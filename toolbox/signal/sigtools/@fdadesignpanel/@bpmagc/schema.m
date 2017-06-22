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
    c = schema.class(pk, 'bpmagc', findclass(pk, 'abstractmagc'));
    % 11 12
    p = schema.prop(c, 'Wstop1', 'string');
    p.FactoryValue = '1';
    p.Description = 'spec';
    % 15 16
    p = schema.prop(c, 'Wpass', 'string');
    p.FactoryValue = '1';
    p.Description = 'spec';
    % 19 20
    p = schema.prop(c, 'Wstop2', 'string');
    p.FactoryValue = '1';
    p.Description = 'spec';
    % 23 24
    p = schema.prop(c, 'Astop1', 'string');
    p.FactoryValue = '80';
    p.Description = 'spec';
    % 27 28
    p = schema.prop(c, 'Apass', 'string');
    p.FactoryValue = '1';
    p.Description = 'spec';
    % 31 32
    p = schema.prop(c, 'Astop2', 'string');
    p.FactoryValue = '60';
    p.Description = 'spec';
    % 35 36
    p = schema.prop(c, 'Dstop1', 'string');
    p.FactoryValue = '.001';
    p.Description = 'spec';
    % 39 40
    p = schema.prop(c, 'Dpass', 'string');
    p.FactoryValue = '.01';
    p.Description = 'spec';
    % 43 44
    p = schema.prop(c, 'Dstop2', 'string');
    p.FactoryValue = '.01';
    p.Description = 'spec';
    % 47 48
    p = schema.prop(c, 'Estop1', 'string');
    p.FactoryValue = '0.001';
    p.Description = 'spec';
    % 51 52
    p = schema.prop(c, 'Epass', 'string');
    p.FactoryValue = '0.9';
    p.Description = 'spec';
    % 55 56
    p = schema.prop(c, 'Estop2', 'string');
    p.FactoryValue = '0.01';
    p.Description = 'spec';
end % function

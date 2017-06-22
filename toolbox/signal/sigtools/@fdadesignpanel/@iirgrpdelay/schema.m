function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdadesignpanel');
    c = schema.class(pk, 'iirgrpdelay', pk.findclass('freqedges'));
    % 10 11
    p = schema.prop(c, 'GroupDelayVector', 'string');
    p.FactoryValue = '[2 3 1]';
    p.Description = 'spec';
    % 14 15
    p = schema.prop(c, 'WeightVector', 'string');
    p.FactoryValue = '[1 1 1]';
    p.Description = 'spec';
end % function

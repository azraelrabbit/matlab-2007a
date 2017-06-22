function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdadesignpanel');
    c = schema.class(pk, 'lpnorm', pk.findclass('freqedges'));
    % 10 11
    p = schema.prop(c, 'MagnitudeVector', 'string');
    p.FactoryValue = '[.4845 ./ (1 - ((0:.0005:.0175)./0.0179).^2).^0.25 0 0 0 0]';
    p.Description = 'spec';
    % 14 15
    p = schema.prop(c, 'WeightVector', 'string');
    p.FactoryValue = '[ones(1,39) 300]';
    p.Description = 'spec';
end % function

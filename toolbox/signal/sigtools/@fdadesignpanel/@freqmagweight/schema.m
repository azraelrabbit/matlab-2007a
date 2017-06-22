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
    c = schema.class(pk, 'freqmagweight', findclass(pk, 'freqvector'));
    % 12 14
    % 13 14
    p = schema.prop(c, 'MagnitudeVector', 'string');
    p.FactoryValue = '[1./sinc(0:.05:.55) 0 0]';
    p.Description = 'spec';
    % 17 18
    p = schema.prop(c, 'WeightVector', 'string');
    p.FactoryValue = '[ones(1,7)]';
    p.Description = 'spec';
end % function

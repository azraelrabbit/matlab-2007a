function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('adaptfilt');
    % 9 11
    % 10 11
    c = schema.class(pk, 'abstractrls', findclass(pk, 'adaptdffir'));
    c.Description = 'abstract';
    % 13 15
    % 14 15
    p = schema.prop(c, 'ForgettingFactor', 'double0t1');
    p.FactoryValue = 1.0;
end % function

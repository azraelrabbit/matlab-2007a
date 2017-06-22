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
    c = schema.class(pk, 'lms', findclass(pk, 'adaptdffir'));
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    p = schema.prop(c, 'StepSize', 'udouble');
    p.FactoryValue = .1;
    p.SetFunction = @set_step;
    % 19 20
    p = schema.prop(c, 'Leakage', 'double0t1');
    p.FactoryValue = 1.0;
end % function

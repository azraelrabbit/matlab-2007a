function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('adaptalg');
    % 10 12
    % 11 12
    c = schema.class(pk, 'lms', findclass(pk, 'baseclass'));
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    p = schema.prop(c, 'StepSize', 'udouble');
    p.FactoryValue = .1;
    % 24 26
    % 25 26
    p = schema.prop(c, 'LeakageFactor', 'double0t1');
    p.FactoryValue = 1.0;
end % function

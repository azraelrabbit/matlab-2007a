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
    c = schema.class(pk, 'normlms', findclass(pk, 'lms'));
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    p = schema.prop(c, 'Bias', 'udouble');
    p.FactoryValue = 0.0;
end % function

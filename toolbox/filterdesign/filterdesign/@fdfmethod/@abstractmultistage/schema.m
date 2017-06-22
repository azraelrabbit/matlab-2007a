function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdfmethod');
    c = schema.class(pk, 'abstractmultistage', findclass(findpackage('fmethod'), 'abstractfir'));
    % 10 11
    set(c, 'Description', 'abstract');
    % 12 13
    p = schema.prop(c, 'rcf', 'int');
    p.FactoryValue = 1.0;
end % function

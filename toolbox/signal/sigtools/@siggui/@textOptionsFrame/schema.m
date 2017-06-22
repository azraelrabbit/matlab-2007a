function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 11
    % 10 11
    c = schema.class(pk, 'textOptionsFrame', pk.findclass('abstractoptionsframe'));
    % 12 14
    % 13 14
    p = schema.prop(c, 'Text', 'string vector');
    p.FactoryValue = cellhorzcat('', xlate('There are no optional parameters for this design method.'));
end % function

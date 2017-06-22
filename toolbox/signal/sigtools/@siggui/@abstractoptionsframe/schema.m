function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('siggui');
    % 10 12
    % 11 12
    c = schema.class(pk, 'abstractoptionsframe', pk.findclass('sigcontainer'));
    set(c, 'Description', 'abstract');
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(c, 'Name', 'string');
    set(p, 'FactoryValue', 'Options');
end % function

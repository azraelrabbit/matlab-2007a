function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'AbstractConstrainedDesign', pk.findclass('AbstractDesign'));
    % 10 11
    set(c, 'Description', 'abstract');
end % function

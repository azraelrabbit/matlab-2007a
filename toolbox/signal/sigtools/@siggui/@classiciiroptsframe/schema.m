function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    c = schema.class(pk, 'classiciiroptsframe', pk.findclass('abstractoptionsframe'));
    % 10 11
    schema.prop(c, 'MatchExactly', 'passstop');
end % function

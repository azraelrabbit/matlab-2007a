function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 10
    c = schema.class(pk, 'fsdialog', pk.findclass('dialog'));
    % 11 12
    e = schema.event(c, 'NewFs');
end % function

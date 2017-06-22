function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdfmethod');
    fmpk = findpackage('fmethod');
    c = schema.class(pk, 'abstractellip', fmpk.findclass('abstractellip'));
    set(c, 'Description', 'abstract');
end % function

function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdfmethod');
    c = schema.class(pk, 'abstractellipbpbscutoffwas', pk.findclass('abstractellipcutoff'));
    % 10 11
    set(c, 'Description', 'abstract');
end % function

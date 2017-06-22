function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('filtresp');
    % 9 10
    schema.class(pk, 'stepz', findclass(pk, 'timeresp'));
end % function

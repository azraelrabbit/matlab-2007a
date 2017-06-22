function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fmethod');
    c = schema.class(pk, 'abstractsimplecheby2', pk.findclass('abstractcheby2'));
    set(c, 'Description', 'abstract');
end % function

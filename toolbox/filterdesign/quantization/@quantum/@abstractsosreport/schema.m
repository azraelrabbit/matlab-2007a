function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'abstractsosreport', pk.findclass('abstractiirreport'));
    set(c, 'Description', 'abstract');
end % function

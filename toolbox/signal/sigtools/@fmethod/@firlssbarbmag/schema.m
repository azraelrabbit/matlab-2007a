function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fmethod');
    parent = findclass(pk, 'abstractfirlssbarbmag');
    c = schema.class(pk, 'firlssbarbmag', parent);
end % function

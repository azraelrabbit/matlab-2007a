function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 11
    % 10 11
    c = schema.class(pk, 'magtext', pk.findclass('abstract_specsframe'));
    set(c, 'Description', 'Magnitude Specifications');
    % 13 15
    % 14 15
    p = schema.prop(c, 'text', 'string vector');
end % function

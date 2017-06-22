function schema
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    pk = findpackage('siggui');
    % 7 8
    c = schema.class(pk, 'cmagspecs', pk.findclass('magspecs'));
    % 9 10
    p = schema.prop(c, 'ConstrainedBands', 'posint_vector');
end % function

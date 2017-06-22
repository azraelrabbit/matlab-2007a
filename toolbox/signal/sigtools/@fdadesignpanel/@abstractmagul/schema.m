function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdadesignpanel');
    c = schema.class(pk, 'abstractmagul', pk.findclass('abstractfiltertype'));
    c.Description = 'abstract';
end % function

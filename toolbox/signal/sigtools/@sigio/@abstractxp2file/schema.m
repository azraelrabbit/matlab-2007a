function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigio');
    c = schema.class(pk, 'abstractxp2file', pk.findclass('abstractxpdestwvars'));
    c.Description = 'abstract';
    % 11 12
    schema.prop(c, 'FileName', 'string');
    schema.prop(c, 'FileExtension', 'string');
    schema.prop(c, 'DialogTitle', 'string');
end % function

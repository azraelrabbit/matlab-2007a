function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    c = schema.class(pk, 'cfi', pk.findclass('siggui'));
    % 10 11
    p = schema.prop(c, 'Filter', 'mxArray');
    set(p, 'AccessFlags.AbortSet', 'Off');
    % 13 14
    schema.prop(c, 'Source', 'string');
end % function

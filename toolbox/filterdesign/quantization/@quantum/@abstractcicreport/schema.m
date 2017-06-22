function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'abstractcicreport', pk.findclass('abstractreport'));
    set(c, 'Description', 'abstract');
    % 11 12
    p = schema.prop(c, 'nsections', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 14 15
end % function

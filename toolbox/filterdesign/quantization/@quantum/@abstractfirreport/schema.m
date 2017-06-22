function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'abstractfirreport', pk.findclass('abstractreport'));
    set(c, 'Description', 'abstract');
    % 11 12
    findclass(pk, 'abstractlog');
    % 13 14
    p = schema.prop(c, 'Product', 'quantum.abstractlog');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 16 18
    % 17 18
    p = schema.prop(c, 'Accumulator', 'quantum.abstractlog');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
end % function

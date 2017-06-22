function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'firtdecimreport', pk.findclass('abstractfirtreport'));
    % 10 11
    findclass(pk, 'abstractlog');
    % 12 13
    p = schema.prop(c, 'PolyAcc', 'quantum.abstractlog');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
end % function

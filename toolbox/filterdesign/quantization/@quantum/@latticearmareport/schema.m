function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'latticearmareport', pk.findclass('abstractreport'));
    % 10 11
    findclass(pk, 'abstractlog');
    % 12 13
    p = schema.prop(c, 'States', 'quantum.abstractlog');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 15 17
    % 16 17
    p = schema.prop(c, 'LatticeProd', 'quantum.abstractlog');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 19 21
    % 20 21
    p = schema.prop(c, 'LatticeAcc', 'quantum.abstractlog');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 23 25
    % 24 25
    p = schema.prop(c, 'LadderProd', 'quantum.abstractlog');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 27 29
    % 28 29
    p = schema.prop(c, 'LadderAcc', 'quantum.abstractlog');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
end % function

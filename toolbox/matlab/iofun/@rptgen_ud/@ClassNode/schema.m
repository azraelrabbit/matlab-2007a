function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pkgRG = findpackage('rptgen');
    pkgUD = findpackage('rptgen_ud');
    % 9 12
    % 10 12
    c = schema.class(pkgUD, 'ClassNode', pkgRG.findclass('rpt_all'));
    % 12 16
    % 13 16
    % 14 16
    p = schema.prop(c, 'ClassPointer', 'schema.class');
    % 16 19
    % 17 19
    p = schema.prop(c, 'IsCanonical', 'bool');
    p.AccessFlags.Init = 'on';
    p.FactoryValue = logical(1);
end

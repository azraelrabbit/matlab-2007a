function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    pkg = findpackage('rptgen');
    pkgRG = findpackage('rptgen');
    % 12 13
    h = schema.class(pkg, 'crg_empty', pkgRG.findclass('rptcomponent'));
    % 14 17
    % 15 17
    % 16 17
    p = rptgen.makeProp(h, 'DescString', 'string');
    p.AccessFlags.Init = 'on';
    p.AccessFlags.PublicGet = 'off';
    p.FactoryValue = '';
    % 21 23
    % 22 23
    rptgen.makeStaticMethods(h, {}, {});
    % 24 25
end % function

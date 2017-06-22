function schema
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    pkg = findpackage('rptgen_sl');
    pkgRG = findpackage('rptgen');
    % 22 23
    h = schema.class(pkg, 'CModelAdvisor', pkgRG.findclass('rptcomponent'));
    % 24 26
    % 25 26
    p = rptgen.prop(h, 'ReuseReport', 'bool', true, 'Use existing report');
    % 27 29
    % 28 29
    rptgen.makeStaticMethods(h, {}, {});
    % 30 31
end % function

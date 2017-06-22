function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkgLO = findpackage('rptgen_lo');
    pkgRG = findpackage('rptgen');
    % 11 12
    h = schema.class(pkgLO, 'rpt_if_comp', pkgRG.findclass('rptcomponent'));
    % 13 15
    % 14 15
    p = rptgen.prop(h, 'TrueText', 'string', '', xlate('If component has no children, insert text:'));
    % 16 19
    % 17 19
    % 18 19
    rptgen.makeStaticMethods(h, {}, {'getTrueTextOutlineString';'qe_if_test'});
    % 20 23
    % 21 23
    % 22 23
end % function

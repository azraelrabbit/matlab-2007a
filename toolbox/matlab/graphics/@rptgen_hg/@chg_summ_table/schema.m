function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('rptgen_hg');
    pkgRG = findpackage('rptgen');
    % 9 10
    h = schema.class(pkg, 'chg_summ_table', pkgRG.findclass('rptsummtable'));
    % 11 13
    % 12 13
    rptgen.makeStaticMethods(h, {'summ_getTypeList';'summ_getDefaultType';'summ_getDefaultTypeInfo'}, {});
    % 14 18
    % 15 18
    % 16 18
    % 17 18
end % function

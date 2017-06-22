function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('RptgenRMI');
    pkgRG = findpackage('rptgen_sl');
    % 9 10
    h = schema.class(pkg, 'CSummaryTable', pkgRG.findclass('csl_summ_table'));
    % 11 13
    % 12 13
    rptgen.makeStaticMethods(h, {'summ_getDefaultType';'summ_getDefaultTypeInfo';'summ_getTypeList'}, {});
    % 14 17
    % 15 17
    % 16 17
end % function

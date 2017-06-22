function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkgFP = findpackage('rptgen_fp');
    pkgSL = findpackage('rptgen_sl');
    % 9 10
    h = schema.class(pkgFP, 'cfp_summ_table', pkgSL.findclass('csl_summ_table'));
    % 11 13
    % 12 13
    rptgen.makeStaticMethods(h, {'summ_getTypeList';'summ_getDefaultType';'summ_getDefaultTypeInfo'}, {});
    % 14 18
    % 15 18
    % 16 18
    % 17 18
end % function

function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('rptgen_sl');
    pkgRG = findpackage('rptgen');
    % 9 10
    h = schema.class(pkg, 'csl_summ_table', pkgRG.findclass('rptsummtable'));
    % 11 13
    % 12 13
    rptgen.makeStaticMethods(h, {'summ_getDefaultType';'summ_getDefaultTypeInfo';'summ_getTypeList';'summ_getSplitPropName'}, {'summ_getPropList';'summ_getSplitPropProps';'summ_getSplitPropTypes'});
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
end % function

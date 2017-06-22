function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkgUD = findpackage('rptgen_ud');
    pkgRG = findpackage('rptgen');
    % 9 10
    h = schema.class(pkgUD, 'cud_summ_table', pkgRG.findclass('rptsummtable'));
    % 11 13
    % 12 13
    rptgen.makeStaticMethods(h, {'summ_getDefaultType';'summ_getDefaultTypeInfo';'summ_getTypeList';'summ_getSplitPropName'}, {'summ_getPropList'});
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
end % function

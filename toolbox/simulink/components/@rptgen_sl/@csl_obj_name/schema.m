function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('rptgen_sl');
    pkgRG = findpackage('rptgen');
    % 11 12
    h = schema.class(pkg, 'csl_obj_name', pkgRG.findclass('rpt_name'));
    % 13 14
    lic = 'SIMULINK_Report_Gen';
    % 15 17
    % 16 17
    p = rptgen.prop(h, 'ObjectType', rptgen_sl.enumSimulinkTypeAuto, 'auto', xlate('Object type'), lic);
    % 18 21
    % 19 21
    % 20 21
    p = rptgen.prop(h, 'isFullName', 'bool', false, xlate('Show full path name'), lic);
    % 22 25
    % 23 25
    % 24 25
    rptgen.makeStaticMethods(h, {}, {'name_getGenericType';'name_getName';'name_getObject';'name_getPropSrc'});
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    % 30 31
end % function

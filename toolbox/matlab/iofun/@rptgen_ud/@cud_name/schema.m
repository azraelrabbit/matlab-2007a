function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkgUD = findpackage('rptgen_ud');
    pkgRG = findpackage('rptgen');
    % 11 12
    h = schema.class(pkgUD, 'cud_name', pkgRG.findclass('rpt_name'));
    % 13 14
    p = rptgen.makeProp(h, 'UddType', rptgen_ud.enumObjectTypeAuto, 'auto', xlate('Type'));
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    rptgen.makeStaticMethods(h, {}, {'name_getGenericType';'name_getObject';'name_getPropSrc'});
    % 22 26
    % 23 26
    % 24 26
    % 25 26
end % function

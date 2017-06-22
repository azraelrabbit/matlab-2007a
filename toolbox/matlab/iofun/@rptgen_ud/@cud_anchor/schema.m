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
    h = schema.class(pkgUD, 'cud_anchor', pkgRG.findclass('rpt_anchor'));
    % 13 15
    % 14 15
    p = rptgen.makeProp(h, 'UddType', rptgen_ud.enumObjectTypeAuto, 'auto', xlate('Type'));
    % 16 19
    % 17 19
    % 18 19
    rptgen.makeStaticMethods(h, {}, {'anchor_getGenericType';'anchor_getObject';'anchor_getPropSrc'});
    % 20 24
    % 21 24
    % 22 24
    % 23 24
end % function

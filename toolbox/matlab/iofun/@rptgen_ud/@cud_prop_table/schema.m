function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkgUD = findpackage('rptgen_ud');
    pkgRG = findpackage('rptgen');
    h = schema.class(pkgUD, 'cud_prop_table', pkgRG.findclass('rpt_prop_table'));
    % 10 13
    % 11 13
    % 12 13
    p = rptgen.makeProp(h, 'UddType', rptgen_ud.enumObjectType, 'Class', xlate('Type'));
    % 14 17
    % 15 17
    % 16 17
    rptgen.makeStaticMethods(h, {}, {'pt_applyPresetTable';'pt_getObjectName';'pt_getPresetTableList';'pt_getPropertySource';'pt_getReportedObject'});
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
end % function

function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkgSL = findpackage('rptgen_sl');
    pkgRG = findpackage('rptgen');
    h = schema.class(pkgSL, 'csl_prop_table', pkgRG.findclass('rpt_prop_table'));
    % 10 11
    p = rptgen.prop(h, 'ObjectType', rptgen_sl.enumSimulinkType, 'model', '', 'SIMULINK_Report_Gen');
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    rptgen.makeStaticMethods(h, {}, {'pt_applyPresetTable';'pt_getObjectName';'pt_getPresetTableList';'pt_getPropertySource';'pt_getReportedObject'});
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
end % function

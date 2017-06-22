function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkgFP = findpackage('rptgen_fp');
    pkgRG = findpackage('rptgen');
    h = schema.class(pkgFP, 'cfp_prop_table', pkgRG.findclass('rpt_prop_table'));
    % 10 12
    % 11 12
    rptgen.makeStaticMethods(h, {}, {'pt_applyPresetTable';'pt_getObjectName';'pt_getPresetTableList';'pt_getPropertySource';'pt_getReportedObject'});
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
end % function

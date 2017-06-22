function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    pkg = findpackage('rptgen_hg');
    pkgRG = findpackage('rptgen');
    % 8 10
    h = schema.class(pkg, 'chg_prop_table', pkgRG.findclass('rpt_prop_table'));
    % 10 12
    p = rptgen.makeProp(h, 'ObjectType', {'Figure','Figure';'Axes','Axes';'Object','Object'}, 'Figure', xlate('Object type'));
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    p = rptgen.makeProp(h, 'FilterByClass', 'bool', logical(0), xlate('Filter by class'));
    % 18 21
    % 19 21
    p = rptgen.makeProp(h, 'FilterClass', 'String', '', '');
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    rptgen.makeStaticMethods(h, {}, {'pt_applyPresetTable';'pt_getObjectName';'pt_getPresetTableList';'pt_getPropertySource';'pt_getReportedObject'});
    % 26 33
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
end

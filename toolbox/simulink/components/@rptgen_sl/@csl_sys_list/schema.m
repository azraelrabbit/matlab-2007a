function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen_sl');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkg, 'csl_sys_list', pkgRG.findclass('rpt_list'));
    % 12 15
    % 13 15
    lic = 'SIMULINK_Report_Gen';
    % 15 18
    % 16 18
    p = rptgen.prop(h, 'StartSys', vertcat(cellhorzcat('fromloop', xlate('Current system')), cellhorzcat('top', xlate('Current model'))), 'fromloop', xlate('Build list from'), lic);
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    p = rptgen.prop(h, 'HighlightStartSys', 'bool', true, xlate('Emphasize current system'));
    % 24 28
    % 25 28
    % 26 28
    p = rptgen.prop(h, 'isPeers', 'bool', true, xlate('Display peers of current system'), lic);
    % 28 32
    % 29 32
    % 30 32
    p = rptgen.prop(h, 'ParentDepth', 'int32', 1.0, xlate('Show number of parents'), lic);
    % 32 36
    % 33 36
    % 34 36
    p = rptgen.prop(h, 'ChildDepth', 'int32', 1.0, xlate('Show children to depth'), lic);
    % 36 40
    % 37 40
    % 38 40
    rptgen.makeStaticMethods(h, {}, {'list_getContent'});
    % 40 43
    % 41 43

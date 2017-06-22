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
    h = schema.class(pkg, 'csl_sys_loop', pkgRG.findclass('rpt_looper'));
    % 12 14
    lic = 'SIMULINK_Report_Gen';
    % 14 17
    % 15 17
    p = rptgen.prop(h, 'HierarchicalSectionNumbering', 'bool', false, xlate('Number sections by system hierarchy'), lic);
    % 17 21
    % 18 21
    % 19 21
    p = rptgen.prop(h, 'LoopType', vertcat(cellhorzcat('auto', xlate('Select systems automatically')), cellhorzcat('list', xlate('Custom - use system list:'))), 'auto', xlate('Loop on Systems'), lic);
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    p = rptgen.prop(h, 'ObjectList', 'string vector', {'%<gcs>'}, '', lic);
    % 27 31
    % 28 31
    % 29 31
    p = rptgen.prop(h, 'SortBy', vertcat(cellhorzcat('numBlocks', xlate('By number of blocks in system')), cellhorzcat('systemalpha', xlate('Alphabetically by system name')), cellhorzcat('depth', xlate('By system depth')), cellhorzcat('none', xlate('By traversal order'))), 'systemalpha', xlate('Sort Systems'), lic);
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    p = rptgen.prop(h, 'isFilterList', 'bool', false, horzcat(xlate('Search for'), ':'), lic);
    % 39 47
    % 40 47
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    p = rptgen.prop(h, 'FilterTerms', 'string vector', {'MaskType','.+'}, '', lic);
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    p.Visible = 'off';
    % 53 56
    % 54 56
    rptgen.makeStaticMethods(h, {}, {'loop_getContextString';'loop_getLoopObjects';'loop_getPropSrc';'loop_restoreState';'loop_saveState';'loop_setState';'dlgSectionOptions';'loop_makeSection'});
    % 56 66
    % 57 66
    % 58 66
    % 59 66
    % 60 66
    % 61 66
    % 62 66
    % 63 66
    % 64 66

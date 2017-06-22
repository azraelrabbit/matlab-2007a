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
    h = schema.class(pkg, 'CAnnotationLoop', pkgRG.findclass('rpt_looper'));
    % 12 14
    lic = 'SIMULINK_Report_Gen';
    % 14 17
    % 15 17
    p = rptgen.prop(h, 'SortBy', vertcat(cellhorzcat('alpha', xlate('Alphabetically by text')), cellhorzcat('none', xlate('By traversal order'))), 'alpha', xlate('Sort'), lic);
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    p = rptgen.prop(h, 'isFilterList', 'bool', false, horzcat(xlate('Search for'), ':'), lic);
    % 23 31
    % 24 31
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    p = rptgen.prop(h, 'FilterTerms', 'string vector', {'ClickFcn','.+'}, '', lic);
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    p.Visible = 'off';
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    rptgen.makeStaticMethods(h, {}, {'loop_getContextString';'loop_getLoopObjects';'loop_getPropSrc';'loop_restoreState';'loop_saveState';'loop_setState'});
    % 42 50
    % 43 50
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
